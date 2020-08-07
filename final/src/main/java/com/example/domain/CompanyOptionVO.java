package com.example.domain;

public class CompanyOptionVO {
	private String c_o_id;
	private String c_o_option;
	
	public String getC_o_id() {
		return c_o_id;
	}
	public void setC_o_id(String c_o_id) {
		this.c_o_id = c_o_id;
	}
	public String getC_o_option() {
		return c_o_option;
	}
	public void setC_o_option(String c_o_option) {
		this.c_o_option = c_o_option;
	}
	@Override
	public String toString() {
		return "CompanyOptionVO [c_o_id=" + c_o_id + ", c_o_option=" + c_o_option + "]";
	}
	
	
}
