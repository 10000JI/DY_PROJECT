package com.dev.base.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dev.base.util.FileManager;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Value("${app.upload.board}")
	private String path;
	
	@Autowired
	private FileManager fileManager;
	
	public int setInsert(BoardVO boardVO, MultipartFile[] multipartFiles) throws Exception {
		int result = boardDAO.setInsert(boardVO);
		if(multipartFiles != null) {
			for(MultipartFile multipartFile:multipartFiles) {
				//조건식 또는 =>multipartFile.getSize() != 0 
				if(!multipartFile.isEmpty()) {
					String fileName = fileManager.saveFile(path, multipartFile);
					BoardFileVO boardFileVO = new BoardFileVO();
					boardFileVO.setFileName(fileName);
					boardFileVO.setOriName(multipartFile.getOriginalFilename());
					boardFileVO.setNum(boardVO.getNum());
					result = boardDAO.setBoardFileAdd(boardFileVO);
				}
			}
		}
		return result;
	}
}
