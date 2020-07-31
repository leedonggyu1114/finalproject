package com.example.service;

import org.apache.ibatis.annotations.Param;

import com.example.domain.HotplaceVO;

public interface AdminServiceInterface {

	public void delete(@Param("h_x") String h_x, @Param("h_y") String h_y);
	public void update(HotplaceVO vo);
}
