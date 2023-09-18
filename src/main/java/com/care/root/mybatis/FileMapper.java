package com.care.root.mybatis;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.dto.FileDTO;

public interface FileMapper {
	public void saveData(FileDTO dto);
	public List<FileDTO> getData();
	public int delete(String id);
	public List<FileDTO> getModify(String id);
	public void modify(FileDTO dto);
}
