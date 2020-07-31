package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.HotplaceVO;
import com.example.mapper.AdminMapper;

@Service
public class AdminService implements AdminServiceInterface{

	@Autowired
	AdminMapper mapper;
	
	@Transactional
	@Override
	public void delete(String h_x, String h_y) {
		
		mapper.deleteimages(h_x, h_y);	
		mapper.delete(h_x, h_y);
	}

	@Override
	public void update(HotplaceVO vo) {
		System.out.println(vo.toString());
		mapper.deleteimages(vo.getH_x(), vo.getH_y());
		for(String image:vo.getH_i_images()) {			
			mapper.insertimages(image,vo.getH_x(), vo.getH_y());
		}
		mapper.update(vo);
	}

}
