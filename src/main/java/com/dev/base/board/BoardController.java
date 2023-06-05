package com.dev.base.board;

import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dev.base.member.MemberVO;
import com.dev.base.util.Pager;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	
	//add
	@GetMapping("add")
	public ModelAndView setInsert(@ModelAttribute BoardVO boardVO) throws Exception{
		ModelAndView mv = new ModelAndView();
//		List<StackVO> stackVO = boardService.getStackList();
//		mv.addObject("list", stackVO);
		mv.setViewName("board/add");
		return mv;
	}
		
	@PostMapping("add")
	public ModelAndView setInsert(@Valid BoardVO boardVO, BindingResult bindingResult, MultipartFile[] boardFiles, @RequestParam("selectedValuesInput") List<String> selectedValuesInput) throws Exception {
	    ModelAndView mv = new ModelAndView();
	    log.warn("========== {}==========", selectedValuesInput);
	    List<FieldError> errors = bindingResult.getFieldErrors();
	    if (bindingResult.hasErrors()) {
	        log.warn("========== 검증에 실패 ==========");
	        mv.setViewName("board/add");
	        return mv;
	    }
	    for (MultipartFile multipartFile : boardFiles) {
	        log.info("OriginalName: {} Size: {}", multipartFile.getOriginalFilename(), multipartFile.getSize());
	    }
	    int result = boardService.setInsert(boardVO, boardFiles, selectedValuesInput);
	    mv.setViewName("redirect:/");
	    return mv;
	}
	
	//list
		@GetMapping("list")
		public ModelAndView getList(ModelAndView mv, Pager pager) throws Exception{
		
			log.info("search : {}", pager.getSearch());
			log.info("kind : {}", pager.getKind());
			
			List<BoardVO> ar = boardService.getList(pager);
			
			mv.addObject("list", ar);
			mv.setViewName("board/list");
			return mv;
		}

}
