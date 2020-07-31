package com.example.domain;

import java.util.List;

public class HotplaceVO {

	private String h_x;
	private String h_y;
	private String h_title;
	private String h_address;
	private String h_detail;
	private String h_area;
	private String h_image;
	private String h_tag1;
	private String h_tag2;
	private List<String> h_i_images;
	public String getH_x() {
		return h_x;
	}
	public void setH_x(String h_x) {
		this.h_x = h_x;
	}
	public String getH_y() {
		return h_y;
	}
	public void setH_y(String h_y) {
		this.h_y = h_y;
	}
	public String getH_title() {
		return h_title;
	}
	public void setH_title(String h_title) {
		this.h_title = h_title;
	}
	public String getH_address() {
		return h_address;
	}
	public void setH_address(String h_address) {
		this.h_address = h_address;
	}
	public String getH_detail() {
		return h_detail;
	}
	public void setH_detail(String h_detail) {
		this.h_detail = h_detail;
	}
	public String getH_area() {
		return h_area;
	}
	public void setH_area(String h_area) {
		this.h_area = h_area;
	}
	public String getH_image() {
		return h_image;
	}
	public void setH_image(String h_image) {
		this.h_image = h_image;
	}
	public String getH_tag1() {
		return h_tag1;
	}
	public void setH_tag1(String h_tag1) {
		this.h_tag1 = h_tag1;
	}
	public String getH_tag2() {
		return h_tag2;
	}
	public void setH_tag2(String h_tag2) {
		this.h_tag2 = h_tag2;
	}
	public List<String> getH_i_images() {
		return h_i_images;
	}
	public void setH_i_images(List<String> h_i_images) {
		this.h_i_images = h_i_images;
	}
	@Override
	public String toString() {
		return "HotplaceVO [h_x=" + h_x + ", h_y=" + h_y + ", h_title=" + h_title + ", h_address=" + h_address
				+ ", h_detail=" + h_detail + ", h_area=" + h_area + ", h_image=" + h_image + ", h_tag1=" + h_tag1
				+ ", h_tag2=" + h_tag2 + ", h_i_images=" + h_i_images + "]";
	}

	
	
	
}
