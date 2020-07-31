package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.HotplaceVO;

public interface AdminMapper {

	public void insert(HotplaceVO vo);
	public void insertimages(@Param("images") String images, @Param("h_x") String h_x, @Param("h_y") String h_y);
	public List<HotplaceVO> list();
	public List<String> imagelist(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public HotplaceVO read(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public void delete(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public void deleteimages(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public void update(HotplaceVO vo);
	//public void updateimages(@Param("h_x") String h_x, @Param("h_y") String h_y, @Param("h_i_images") String image);
}
