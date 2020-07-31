package com.example.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.HotplaceVO;

public interface HotplaceMapper {
	
	public List<HotplaceVO> list();
	public ArrayList<String> imagelist(@Param("h_x") String h_x, @Param("h_y") String h_y);
	//public HashMap<String, Object> agefell(HashMap<String, Object> map);
	public int age10(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public int age20(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public int age30(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public int age40(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public int age50(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public int sexM(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public int sexF(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public void likeinsert(@Param("h_x") String h_x, @Param("h_y") String h_y, @Param("u_id") String u_id);
	public void likedelete(@Param("h_x") String h_x, @Param("h_y") String h_y, @Param("u_id") String u_id);
	public ArrayList<HotplaceVO> likelist(String u_id);
	public ArrayList<HashMap<String, Object>> likeuserlist(@Param("h_x") String h_x, @Param("h_y") String h_y);
}
