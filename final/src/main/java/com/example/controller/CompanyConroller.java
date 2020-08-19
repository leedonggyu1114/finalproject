package com.example.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.CompanyVO;
import com.example.mapper.CompanyMapper;

@Controller
@Repository
public class CompanyConroller {

	@Autowired
	CompanyMapper mapper;
	
	
	@RequestMapping("/company/roominsert")
	public void insertroom() {
	}
	
	
	//업체 회원 가입
		@RequestMapping(value="/company/insertroom",method=RequestMethod.POST)
		public String insertComapny(CompanyVO vo,MultipartHttpServletRequest multi,HttpServletRequest request) throws Exception {
			
			String[] arrayParam = request.getParameterValues("hoption");
			
			return "/company/insertroom";
		}
		
}
