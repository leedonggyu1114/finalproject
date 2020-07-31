package com.example.mapper;

import java.util.List;

import com.example.domain.CompanyVO;
import com.example.domain.UserVO;

public interface UserMapper {
	//회원가입
	public void insert(UserVO vo);
	public void insertCompany(CompanyVO vo);
	public void delete(String u_id);
	public void deleteCompany(String c_id);
	
	public UserVO read(String u_id);
	public CompanyVO readCompany(String c_id);
	public String readid(String u_id);
	public String readcompanyid(String c_id);
	public String readcompanyNumber(String c_id);
	//회원가입 이메일 인증
	public int GetKey(String u_id, String u_key);
	public int alter_userKey(String u_id,String key);
	public int GetKeyCompany(String c_id, String c_key);
	public int alter_KeyCompany(String c_id,String key);
	//ID/PW 찾기
	public int checkName(String u_birthday, String u_name);
	public List<UserVO> checkID(String u_birthday, String u_name);
	public void updatePass(String u_id,String u_pass);
	
	public int checkNameCompany(String number, String name);
	public String checkIDCompany(String number, String u_name);
	public void updatePassCompany(String c_id,String c_pass);
	
	//회원 수정
	public void updateUser(UserVO vo);
	public void updateUser2(UserVO vo);
}
