package com.example.service;

import com.example.domain.PassengersVO;

public interface AirPassengersService {
	public void passengersInsert(PassengersVO vo,String u_id,String u_k_id);
	public void bookingcancel(String u_id,String u_k_id,String a_number,String a_b_paydate);
}
