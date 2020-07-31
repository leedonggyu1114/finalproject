package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.HotplaceVO;

public interface HotplaceMapper {
	
	public List<HotplaceVO> list();
	public ArrayList<String> imagelist(@Param("h_x") String h_x, @Param("h_y") String h_y);
}
