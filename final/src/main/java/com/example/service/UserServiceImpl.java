package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.domain.RoomVO;
import com.example.mapper.CompanyMapper;

public class UserServiceImpl implements UserService{

	@Autowired
	CompanyMapper mapper;
	
	@Override
	public void insert(RoomVO vo) {
		
		
		
	}

}
