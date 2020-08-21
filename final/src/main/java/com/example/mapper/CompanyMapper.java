package com.example.mapper;

import java.util.List;

import com.example.domain.CompanyVO;
import com.example.domain.Criteria;
import com.example.domain.RoomVO;

public interface CompanyMapper {

	public void roominsert(RoomVO vo);
	public void roomimagesinsert(String r_i_id,String r_i_roomnum, String r_i_images);
	public List<RoomVO> roomlist(Criteria cri);
	public void insertRoomoption(String r_o_id,String r_o_roomnum,String r_o_option);
	public int roomreadCount(String r_id, String r_roomnum);
	public int totalCount(String r_id);
	public List<RoomVO> imagesread(String r_i_id, String r_i_roomnum);
	public RoomVO read(String r_id,String r_roomnum);
	public List<RoomVO> readRoomoption(String r_o_id,String r_o_roomnum);
}
