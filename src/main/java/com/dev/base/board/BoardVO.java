package com.dev.base.board;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private Long num;
	@NotBlank
	private String title;
	@NotBlank
	private String contents;
	@NotBlank
	private String writer;
	private Date regDate;
	private Long Hit;
	
	private List<BoardFileVO> boardFileVOs; 
}
