package com.dev.base.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


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
		mv.setViewName("board/add");
		return mv;
	}
		
	@PostMapping("add")
	public ModelAndView setInsert(BoardVO qnaVO,MultipartFile[] boardFiles) throws Exception{
		for(MultipartFile multipartFile:boardFiles) {
			log.info("OriginalName: {} Size: {}", multipartFile.getOriginalFilename(), multipartFile.getSize());
			}
		int result = boardService.setInsert(qnaVO, boardFiles);
		//boardFiles는 jsp에서 온 파라미터 이름과 동일하게 하려고, Service는 어떤 이름이 와도 상관X
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
	}
}
