package com.dev.base.board;

import java.util.List;
import java.util.Set;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dev.base.util.FileManager;
import com.dev.base.util.Pager;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Value("${app.upload.board}")
	private String path;
	
	@Autowired
	private FileManager fileManager;
	
	public int setInsert(BoardVO boardVO, MultipartFile[] multipartFiles,List<String> selectedValuesInput) throws Exception {
		int result = boardDAO.setInsert(boardVO);
		if(multipartFiles != null) {
			for(MultipartFile multipartFile:multipartFiles) {
				//조건식 또는 =>multipartFile.getSize() != 0 
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					BoardFileVO boardFileVO = new BoardFileVO();
					boardFileVO.setFileName(fileName);
					boardFileVO.setOriName(multipartFile.getOriginalFilename());
					result = boardDAO.setBoardFileAdd(boardFileVO);
				}
			}
		}
		Set<String> uniqueValues = new HashSet<>(selectedValuesInput); // 중복 제거
	    
	    for (String value : uniqueValues) {
	        result = boardDAO.setStackAdd(value);
	    }
		return result;
	}
	
	public List<BoardStackVO>  getStackList() throws Exception{
		return boardDAO.getStackList();
	}
	
	public List<BoardVO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeStartRow();
		pager.makeNum(boardDAO.getTotalCount(pager));
		return boardDAO.getList(pager);
	}
}
