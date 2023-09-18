package com.care.root.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.dto.FileDTO;

public interface FileService {
	public String IMAGE_REPO="C:\\spring\\image_repo"; // C:/spring/image_repo
	public void fileProcess(String id, String name, MultipartFile file);
	public List<FileDTO> getData();
	public void delete(String file, String id);
	public List<FileDTO> getModify(String id);
	public void modify(String id, String name, @RequestParam MultipartFile file);
	
}
