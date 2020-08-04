package com.example.domain;

public class UsertagVO extends UserVO {
	private String t_id;
	private String t_tag;
	
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getT_tag() {
		return t_tag;
	}
	public void setT_tag(String t_tag) {
		this.t_tag = t_tag;
	}
	
	@Override
	public String toString() {
		return "UsertagVO [t_id=" + t_id + ", t_tag=" + t_tag + "]";
	}
	
	
	
}
