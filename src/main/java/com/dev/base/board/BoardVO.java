package com.dev.base.board;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private Long num;
	private String title;
	private String contents;
	private String writer;
	private Date regDate;
	private Long Hit;
}
