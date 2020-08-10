package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.HotplaceVO;
import com.example.mapper.HotplaceMapper;

@Controller
@RequestMapping("/hotplace/")
public class HotplaceController {
	
	@Resource(name="hotplaceUploadPath") //servlet-context.xml에서 지정한 아이디
	private String hotplacepath;
	@Resource(name="userUploadPath") //servlet-context.xml에서 지정한 아이디
	private String userpath;
	
	
	@Autowired
	HotplaceMapper mapper;
	
	@RequestMapping("list")
	public void list(Model model,HttpSession session) {
		//HashMap<String, Object> imagelist=new HashMap<String, Object>();
		//session.setAttribute("u_id", "user01");
		ArrayList<HotplaceVO> list = new ArrayList<HotplaceVO>();
		for(HotplaceVO vo:mapper.list()) {
			ArrayList<String> images = mapper.imagelist(vo.getH_x(), vo.getH_y());
			vo.setH_i_images(images);
			list.add(vo);
		}
		model.addAttribute("list",list);
	}
	@RequestMapping("taglist")
	@ResponseBody
	public List<HotplaceVO> taglist(String h_tag){
		List<HotplaceVO> taglist=mapper.taglist(h_tag);
		return taglist;
	}
	
	
	@RequestMapping("likelist")
	public void likelist(Model model,HttpSession session) {
		//session.invalidate();
		//session.setAttribute("u_id", "u04");
		String u_id=(String) session.getAttribute("u_id");
		ArrayList<HotplaceVO> likelist = new ArrayList<HotplaceVO>();
		for(HotplaceVO vo:mapper.likelist(u_id)) {
			ArrayList<String> images = mapper.imagelist(vo.getH_x(), vo.getH_y());
			vo.setH_i_images(images);
			likelist.add(vo);
		}
		model.addAttribute("likelist",likelist);
		
	}
	
	@RequestMapping("likeset")
	@ResponseBody
	public ArrayList<HotplaceVO> likeset(String u_id){
		System.out.println("likeset");
		ArrayList<HotplaceVO> likeset = mapper.likelist(u_id);
		return likeset;
	}
	
	
	@RequestMapping("readimages")
	@ResponseBody
	public ArrayList<String> readimages(String h_x,String h_y){
		ArrayList<String> readimages=mapper.imagelist(h_x,h_y);
		return readimages;
	}
	
	
	@RequestMapping("likeuserlist")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> likeuserlist(String h_x, String h_y){
		ArrayList<HashMap<String, Object>> hashmap = mapper.likeuserlist(h_x, h_y);
		return hashmap;
	}
	
	@RequestMapping(value="likeinsert", method=RequestMethod.POST)
	@ResponseBody
	public void likeinsert(String h_x, String h_y, String u_id) {
		System.out.println("insert");
		mapper.likeinsert(h_x, h_y, u_id);
	}
	@RequestMapping(value="likedelete", method=RequestMethod.POST)
	@ResponseBody
	public void likedelete(String h_x, String h_y, String u_id) {
		System.out.println("delete");
		mapper.likedelete(h_x, h_y, u_id);
	}
	
	@RequestMapping("agechart")
	@ResponseBody
	public List<HotplaceVO> agechart(String h_x, String h_y){
		ArrayList agechart = new ArrayList();
		ArrayList array = new ArrayList();
		array.add("");
		array.add("인기핫플레이스");
		agechart.add(array);
		array=new ArrayList();
		array.add("10대");
		array.add(mapper.age10(h_x, h_y));
		agechart.add(array);
		array=new ArrayList();
		array.add("20대");
		array.add(mapper.age20(h_x, h_y));
		agechart.add(array);
		array=new ArrayList();
		array.add("30대");
		array.add(mapper.age30(h_x, h_y));
		agechart.add(array);
		array=new ArrayList();
		array.add("40대");
		array.add(mapper.age40(h_x, h_y));
		agechart.add(array);
		array=new ArrayList();
		array.add("50대");
		array.add(mapper.age50(h_x, h_y));
		agechart.add(array);
		//System.out.println(areachart);

		return agechart;
	}
	
	@RequestMapping("sexchart")
	@ResponseBody
	public List<HotplaceVO> sexchart(String h_x, String h_y){
		ArrayList sexchart = new ArrayList();
		ArrayList array = new ArrayList();
		array.add("");
		array.add("");
		sexchart.add(array);
		array=new ArrayList();
		array.add("남");
		array.add(mapper.sexM(h_x, h_y));
		sexchart.add(array);
		array=new ArrayList();
		array.add("여");
		array.add(mapper.sexF(h_x, h_y));
		sexchart.add(array);
		return sexchart;
	}
	
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName)throws Exception{
		ResponseEntity<byte[]> result=null;
		//display fileName이 있는 경우
		if(!fileName.equals("")) {
			File file=new File(hotplacepath + File.separator + fileName);
			HttpHeaders header=new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
	@RequestMapping("/userdisplay")
	@ResponseBody
	public ResponseEntity<byte[]> userdisplay(String fileName)throws Exception{
		ResponseEntity<byte[]> result=null;
		//display fileName이 있는 경우
		if(!fileName.equals("")) {
			File file=new File(userpath + File.separator + fileName);
			HttpHeaders header=new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}	
}
