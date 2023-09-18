package com.care.root.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.care.root.dto.InfoDTO;

@Service
public class InfoService {
	Map<String, InfoDTO> db;
	ArrayList<InfoDTO> list;
	public InfoService() {
		db = new HashMap<String, InfoDTO>();
		list = new ArrayList<InfoDTO>();
		
		for(int i=0;i<5;i++) {
			InfoDTO dto = new InfoDTO();
			dto.setName("홍길동"+i);
			dto.setAge(i);
			list.add(dto);
			db.put("홍길동"+i, dto);
		}
	}
	public ArrayList<InfoDTO> getList() {
		//select * from table
		return list;
	}
	public InfoDTO getUser(String id) {
		//select * from table where id=id
		return db.get(id);
	}
	public int modify(InfoDTO dto) {
		db.replace(dto.getName(), dto);
		return 1;
	}
	public int insert(InfoDTO dto) {
		db.put(dto.getName(), dto);
		list.add(dto);
		return 1;
	}
	public void delUser(String uId) {
		db.remove(uId); //DB에서 삭제
		for(int i=0;i<list.size();i++) {
			InfoDTO dto = list.get(i);
			if(dto.getName().equals(uId)) {//List에서 삭제
				list.remove(i);
			}
		}
	}
}
