package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.HotplaceVO;
import com.example.mapper.HotplaceMapper;

@Controller
@RequestMapping("/hotplace/")
public class HotplaceController {
	
	@Resource(name="uploadPath") //servlet-context.xml에서 지정한 아이디
	private String path;
	
	@Autowired
	HotplaceMapper mapper;
	
	@RequestMapping("list")
	public void list(Model model) {
		//HashMap<String, Object> imagelist=new HashMap<String, Object>();
		
		ArrayList<HotplaceVO> list = new ArrayList<HotplaceVO>();
		for(HotplaceVO vo:mapper.list()) {
			ArrayList<String> images = mapper.imagelist(vo.getH_x(), vo.getH_y());
			vo.setH_i_images(images);
			list.add(vo);
		}
		System.out.println(list);
		model.addAttribute("list",list);
	}
	/*@RequestMapping("list")
	public void list(Model model) {
		model.addAttribute("list", mapper.list());
		model.addAttribute()
	}*/

	@RequestMapping("readimages")
	@ResponseBody
	public List<String> readimages(String h_x,String h_y){
		System.out.println(h_x + h_y);
		List<String> readimages=mapper.imagelist(h_x,h_y);
		return readimages;
	}
	
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName)throws Exception{
		ResponseEntity<byte[]> result=null;
		//display fileName이 있는 경우
		if(!fileName.equals("")) {
			File file=new File(path + File.separator + fileName);
			HttpHeaders header=new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
}
