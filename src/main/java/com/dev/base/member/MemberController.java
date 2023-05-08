package com.dev.base.member;

import java.util.Enumeration;
import java.util.Random;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.base.util.MailManager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailManager mailManager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

//	@GetMapping("logout")
//	public ModelAndView getLogout(HttpSession session) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		int result = memberService.setLastTimeUpdate(memberVO);
//		session.invalidate();
//		mv.setViewName("redirect:../");
//		return mv;
//	}
	
	
	@GetMapping("findPassword")
	public ModelAndView findPassword(@ModelAttribute MemberVO memberVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/findPassword");
		return mv;
	}
	
	@PostMapping("findPassword")
	public ModelAndView findPassword(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(bindingResult.hasErrors()) {
			log.error("======검증 실패======");
			mv.setViewName("member/findPassword");
		}
		String pass = memberService.generatePassword();
		log.error("======이메일 전송한다======");
		mailManager.send(memberVO.getEmail(), "비밀번호를 재발급합니다","비빌번호는 "+pass+"입니다.");
		memberVO.setPassword(passwordEncoder.encode(pass));
		int result = memberService.setPasswordUpdate(memberVO);
		mv.setViewName("member/login");
		return mv;
	}
	
//	@GetMapping("info")
//	public void info(HttpSession session) {
////		String pw = "12345678";
////		
////		MemberVO memberVO = (MemberVO)memberService.loadUserByUsername("minji");
////		
////		log.error("{} ::::: ", memberVO.getPassword());
////		log.error("{} ::::: ", passwordEncoder.encode(pw)); 
////		log.error("{} ::::: ", memberVO.getPassword().equals(passwordEncoder.encode(pw)));
////		//똑같은 비번을 넣었는데도 불구하고 flase
////		
////		boolean check = passwordEncoder.matches(pw, memberVO.getPassword());
////		log.error("{} ::::::",check);
//		
//		//로그인 후 확인하는 과정
//		log.error("================= Login Info =================");
//		//세션 이름 알아내기 => SPRING_SECURITY_CONTEXT
//		Enumeration<String> names = session.getAttributeNames();
//		while(names.hasMoreElements()) {
//			log.error("================={}=================",names.nextElement());
//		}
//		//세션 가져와서 정보 읽어보기
//		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
//		log.error("=={}==",obj);
//		SecurityContextImpl contextImpl = (SecurityContextImpl)obj;
//		Authentication authentication = contextImpl.getAuthentication();
//		log.error("==Name:{}==",authentication.getName());
//		log.error("===Detail:{}==",authentication.getDetails());
//		log.error("==MemberVO:{}==",authentication.getPrincipal());
//		MemberVO memberVO = (MemberVO)authentication.getPrincipal();
//		log.error("==VO detail:{}==",memberVO.getRoleVOs().get(0).getRoleName());
//		
//	}
	
//	@GetMapping("admin")
//	public void getAdmin() throws Exception{
//		
//	}
//	

//	
//	@GetMapping("idDuplicateCheck")
//	@ResponseBody
//	public boolean idDuplicateCheck(MemberVO memberVO) throws Exception{
//		log.debug("================ ID 중복 체크 =================");
//		boolean check=false;
//		
//		memberVO = memberService.idDuplicateCheck(memberVO);
//		
//		if(memberVO == null) {
//			check=true;
//		}
//		
//		return check;
//	}
//	
	@GetMapping("join")
	public ModelAndView setJoin(@ModelAttribute MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join");
		return mv;
	}
	
	@PostMapping("join")
	public ModelAndView setJoin(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean check  = memberService.memberCheck(memberVO, bindingResult);
		if(check) {
			log.warn("======검증에 실패======");
			mv.setViewName("member/join");
			return mv;
		}
		int result = memberService.setJoin(memberVO);
		mv.setViewName("redirect:../");
		return mv;
	}
	

	
	@GetMapping("login")
	public ModelAndView getLogin(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		//로그인 후 뒤로가기 했을때, 다시 로그인 화면 나타나는 것을 방지
		if(obj==null) {			
			mv.setViewName("member/login");
		}else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
//	@PostMapping
//	public ModelAndView getLogin(MemberVO memberVO, HttpSession session) throws Exception {
//		ModelAndView mv =new ModelAndView();
//		memberVO = memberService.getLogin(memberVO);
//		mv.setViewName("redirect:./login");
//		if(memberVO != null) {
//			session.setAttribute("member", memberVO);
//			mv.setViewName("redirect:../");
//		}
//		return mv;
//	}
	
	@GetMapping("myPage")
	public void getMyPage() throws Exception{
		
	}
	
	@PostMapping("/checkMail") // AJAX와 URL을 매핑시켜줌 
	@ResponseBody  //AJAX후 값을 리턴하기위해 작성
	public String SendMail(String email) throws MessagingException {
	    UUID uuid = UUID.randomUUID(); // 랜덤한 UUID 생성
	    String key = uuid.toString().substring(0, 7); // UUID 문자열 중 7자리만 사용하여 인증번호 생성
	    String sub ="인증번호 입력을 위한 메일 전송";
	    String con = "인증 번호 : "+key;
	    log.error("======{}======",email);
	    mailManager.send(email,sub,con);
	    return key;
	}
}
