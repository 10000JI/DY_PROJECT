package com.dev.base.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dev.base.util.Pager;

@Mapper
public interface BoardDAO {
	//글쓰기
	public int setInsert(BoardVO boardVO) throws Exception;
	
	//글쓰기-사진
	public int setBoardFileAdd(BoardFileVO boardFileVO) throws Exception;
	
	//글쓰기-기술(중복가능)
	public int setStackAdd(String string) throws Exception;
	
	//기술리스트
	public List<StackVO> getStackList() throws Exception;
	
	//전체글리스트
	public List<BoardVO> getList(Pager pager) throws Exception;
	
	//글갯수
	public Long getTotalCount(Pager pager) throws Exception;
	
	//글 디테일
	public BoardVO getDetail(BoardVO boardVO) throws Exception;
	
	//글 디테일-사진
	public BoardFileVO getFileDetail(BoardFileVO boardFileVO) throws Exception;
	
	
}
