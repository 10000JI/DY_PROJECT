package com.dev.base.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberSocialService extends DefaultOAuth2UserService {
	
	@Autowired
	public MemberDAO memberDAO;
		
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		// TODO Auto-generated method stub
		// kakao에서 로그인 처리 후 실행
		
		log.error("{} :::: social",userRequest.getAccessToken()); 
		
		ClientRegistration registration = userRequest.getClientRegistration();
		
		log.error("{} :::: ",registration.getRegistrationId());
		log.error("{} :::: ",registration.getScopes());
		log.error("{} :::: ",registration.getClientName());
		log.error("{} :::: ",registration.getClientId());
		OAuth2User user =  super.loadUser(userRequest);
		log.error("{} :::: ",user.getName());
		
		return this.socialJoinCheck(userRequest);
		//호출
	}
	
	//카카오로그인이나 네이버로그인할때 따로 메소드 생성하라고 빼놓았다
	//카카오로그인이기 때문에 카카오 로그인 호출
	private OAuth2User socialJoinCheck(OAuth2UserRequest auth2UserRequest) {
		//DB에서 조회 후(=>db에서 일반회원인지 소셜로그인 회원인지 확인하는 컬럼이 필요하다) 회원 추가 또는 회원정보(Role) 조회
		//=> 처음이 아니라면 INSERT 하는 과정이 필요 (db 조회 전에)
		//Kakao에서 받은 정보를 MemberVO로 변경
		OAuth2User user =  super.loadUser(auth2UserRequest);
		
		Map<String,Object> map  = user.getAttributes();
		Iterator<String> it = map.keySet().iterator();
		
		while(it.hasNext()) {
			String key = it.next();
			log.error("Key::{}",key);
			log.error("Value::{}",map.get(key));
		}
		log.error("id{}::",map.get("id"));
		log.error("id{}::",map.get("email"));
		
		MemberVO memberVO = new MemberVO();
		memberVO.setAttributes(map); //OAuth2User정보 넣어야
		memberVO.setUsername(map.get("id").toString());
		HashMap<String,Object> m = (HashMap<String,Object>) map.get("kakao_account");
		memberVO.setEmail(m.get("email").toString());
		
		m = (HashMap<String,Object>) map.get("properties");
		log.error("NichkName{}::",m.get("nickname"));
		memberVO.setName(m.get("nickname").toString());
		
		
		List<RoleVO> roleVOs = new ArrayList<>();
		//DB 조회
		RoleVO roleVO = new RoleVO();
		roleVO.setRoleName("ROLL_MEMBER");
		roleVOs.add(roleVO);
		memberVO.setRoleVOs(roleVOs);
		memberVO.setEnabled(true);
		
		Map<String, Object> map1 = new HashMap<>();
		map1.put("username", memberVO.getUsername());
		map1.put("num", 3);
		try {
			int result = memberDAO.setJoin(memberVO);
			result = memberDAO.setMemberRole(map1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberVO;
	}
}
