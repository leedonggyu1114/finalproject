package com.example.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.CompanyVO;
import com.example.domain.RoomVO;
import com.example.mapper.CompanyMapper;

@Controller
@Repository
public class CompanyConroller {
	@Resource(name="companyUploadPath")
	private String companypath;

	@Autowired
	CompanyMapper mapper;
	
	
	@RequestMapping("/company/roominsert")
	public void insertroom() {
	}
	
	//숙소search페이지 이동
	@RequestMapping("/stay/search")
	public void staysearch() {
	}
	
	//업체 회원 가입
		@RequestMapping(value="/company/insertroom",method=RequestMethod.POST)
		public String insertComapny(RoomVO vo,MultipartHttpServletRequest multi,HttpServletRequest request) throws Exception {
			
			String[] arrayParam = request.getParameterValues("hoption");
			//대표이미지 업로드
			MultipartFile file=multi.getFile("file");
			if(!file.isEmpty()) {
				String image=System.currentTimeMillis()+file.getOriginalFilename();
				file.transferTo(new File(companypath + File.separator + image));
				vo.setR_image(image);
			}
			//추가 이미지 업로드
			List<MultipartFile> files=multi.getFiles("files");
			List<String> images=new ArrayList<String>();
			for(MultipartFile attfile:files) {
				if(!attfile.isEmpty()) {
					String image=System.currentTimeMillis()+attfile.getOriginalFilename();
					attfile.transferTo(new File(companypath + File.separator + image));
					images.add(image);
				}
			}
			
			
			
			return "/company/insertroom";
		}
		
}
