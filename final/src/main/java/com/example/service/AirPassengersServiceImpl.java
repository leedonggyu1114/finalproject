package com.example.service;

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
	
		//List<String> a_p_residentRegistration=new ArrayList<String>();
//		List<String> a_p_residentRegistration= vo.getA_p_residentregistration();
//		System.out.println(a_p_residentRegistration);
//		List<String> a_p_name=vo.getA_p_name();
//		
//		List<String> a_p_gender=vo.getA_p_gender();
//		
//		List<String> a_p_seat=vo.getA_p_seat();

	@Transactional
	@Override
	public void passengersInsert(PassengersVO vo, String u_id, String u_k_id) {
		System.out.println(vo.toString());
		
		if(vo.getA_number1().equals("")) {
			System.out.println("null");
			mapper.airbookingInsert(u_id, u_k_id, vo.getA_number());
			for(int i=0; i<vo.getSum(); i++) {
				mapper.passengersInsert(u_id, u_k_id, vo.getA_number(), vo.getA_p_residentregistration().get(i), 
						vo.getA_p_name().get(i),vo.getA_p_gender().get(i) , vo.getA_p_seat().get(i));
			}
			mapper.setCount(vo.getSum(), vo.getA_number());
		}else {
			System.out.println("not null");
			mapper.airbookingInsert(u_id, u_k_id, vo.getA_number());
			mapper.airbookingInsert(u_id, u_k_id, vo.getA_number1());
			for(int i=0; i<vo.getSum(); i++) {
				mapper.passengersInsert(u_id, u_k_id, vo.getA_number(), vo.getA_p_residentregistration().get(i), 
						vo.getA_p_name().get(i),vo.getA_p_gender().get(i) , vo.getA_p_seat().get(i));
			}
			for(int i=0; i<vo.getSum(); i++) {
				mapper.passengersInsert(u_id, u_k_id, vo.getA_number1(), vo.getA_p_residentregistration().get(i), 
						vo.getA_p_name().get(i),vo.getA_p_gender().get(i) , vo.getA_p_backseat().get(i));
			}
			mapper.setCount(vo.getSum(), vo.getA_number());
			mapper.setCount(vo.getSum(), vo.getA_number1());
		}
		
		
		
	}
}
