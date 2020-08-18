package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.junit.runners.Parameterized.Parameters;

import com.example.domain.AirVO;
import com.example.domain.PassengersVO;

public interface AirMapper {
    public List<AirVO> airList(AirVO vo);
    public int totalCount();
    public void insert(AirVO vo);
    public String read();
    public AirVO bookingPeople(String a_number);
    public AirVO listRead(String a_number);
   // public void passengersInsert(PassengersVO vo);
    public void passengersInsert(@Param("u_id") String u_id,@Param("u_k_id") String u_k_id , @Param("a_number") String a_number,@Param("a_p_residentRegistration") String a_p_residentRegistration,@Param("a_p_name") String a_p_name,@Param("a_p_gender") String a_p_gender,@Param("a_p_seat") String a_p_seat);
    public void airbookingInsert(@Param("u_id") String u_id,@Param("u_k_id") String u_k_id , @Param("a_number") String a_number);
    public void setCount(@Param("sum")int sum,@Param("a_number") String a_number);
    public List<String> seatlist(String a_number);
    public List<PassengersVO> bookinglist(@Param("u_id") String u_id,@Param("u_k_id") String u_k_id);
}
