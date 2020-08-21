package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.RoomVO;
import com.example.mapper.CompanyMapper;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	CompanyMapper mapper;
	
	@Transactional
	@Override
	public void insert(RoomVO vo) {
		mapper.roominsert(vo);
		
		String r_i_id=vo.getR_id();
		String r_i_roomnum=vo.getR_roomnum();
		List<String> images=vo.getImages();
		for(String image:images) {
			mapper.roomimagesinsert(r_i_id, r_i_roomnum, image);			
		}
		
	}

}
