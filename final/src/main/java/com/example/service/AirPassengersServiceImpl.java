package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.PassengersVO;
import com.example.mapper.AirMapper;
@Service
public class AirPassengersServiceImpl implements AirPassengersService {
	@Autowired
	AirMapper mapper;
	
	@Transactional
	@Override
	public void passengersInsert(PassengersVO vo,String u_id) {
//		//List<String> a_p_residentRegistration=new ArrayList<String>();
//		List<String> a_p_residentRegistration= vo.getA_p_residentregistration();
//		System.out.println(a_p_residentRegistration);
//		List<String> a_p_name=vo.getA_p_name();
//		
//		List<String> a_p_gender=vo.getA_p_gender();
//		
//		List<String> a_p_seat=vo.getA_p_seat();
//		
//		
//		
//		
//		for(int i=0; i<vo.getSum(); i++) {
//			
//			for(int k=0; k<vo.getA_p_name().size(); k++) {
//				System.out.println(u_id + vo.getA_number() + a_p_residentRegistration.get(i).valueOf(k).toString() + a_p_gender.get(i) + a_p_seat.get(i));
//				mapper.passengersInsert(u_id, vo.getA_number(), a_p_residentRegistration.get(i), a_p_name.get(i), a_p_gender.get(i), a_p_seat.get(i));
//			}
//		}
//		mapper.setCount(vo.getSum(), vo.getA_number());
	}
}
