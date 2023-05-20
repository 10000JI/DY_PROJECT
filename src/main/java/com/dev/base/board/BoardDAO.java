package com.dev.base.board;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	//글쓰기
	public int setInsert(BoardVO boardVO) throws Exception;
	
	public int setBoardFileAdd(BoardFileVO boardFileVO) throws Exception;
}
