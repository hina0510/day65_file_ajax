package com.care.root.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.dto.FileDTO;
import com.care.root.mybatis.FileMapper;

@Service //bean 가능
public class FileServiceImpl implements FileService{
	@Autowired FileMapper mapper;
	
	public void fileProcess(String id, String name, MultipartFile file) {
		FileDTO dto = new FileDTO();
		dto.setId(id);
		dto.setName(name);
		
		if(file.getSize() != 0) { //!file.isEmpty() 파일이 있으면 실행
			SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
			String sysFileName = fo.format(new Date());
			sysFileName+=file.getOriginalFilename();
			System.out.println(sysFileName);
			File saveFile = new File(IMAGE_REPO +"/"+sysFileName);
			try {
				file.transferTo(saveFile);
				dto.setImgName(sysFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			dto.setImgName("nan");
		}
		try {
			mapper.saveData(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<FileDTO> getData() {
		List<FileDTO> list = null;
		try {
			list = mapper.getData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void delete(String file, String id) {
		try {
			int result = mapper.delete(id);
			if (result==1) {
				File d = new File(IMAGE_REPO+"/"+file);
				System.out.println("d.exists : "+d.exists());
				if(d.exists()) {
					d.delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<FileDTO> getModify(String id) {
		List<FileDTO> list = null;
		try {
			list = mapper.getModify(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void modify(String id, String name, @RequestParam MultipartFile file) {
		FileDTO dto = new FileDTO();
		dto.setId(id);
		dto.setName(name);
		
		SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
		String sysFileName = fo.format(new Date());
		sysFileName+=file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO +"/"+sysFileName);
		try {
			file.transferTo(saveFile);
			dto.setImgName(sysFileName);
			System.out.println(dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getImgName());
			mapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
