package com.dev.base.board;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardStackVO {
	private Integer num;
	private Integer stackNum;
	
	private List<StackVO> stackVOs; 
}
