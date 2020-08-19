package com.example.domain;

public class BlackVO {
	private String u_from_id;
	private String u_to_id;
	private String u_from_k_id;
	private String u_to_k_id;
	private String b_content;
	private String b_date;
	
	public String getU_from_id() {
		return u_from_id;
	}
	public void setU_from_id(String u_from_id) {
		this.u_from_id = u_from_id;
	}
	public String getU_to_id() {
		return u_to_id;
	}
	public void setU_to_id(String u_to_id) {
		this.u_to_id = u_to_id;
	}
	public String getU_from_k_id() {
		return u_from_k_id;
	}
	public void setU_from_k_id(String u_from_k_id) {
		this.u_from_k_id = u_from_k_id;
	}
	public String getU_to_k_id() {
		return u_to_k_id;
	}
	public void setU_to_k_id(String u_to_k_id) {
		this.u_to_k_id = u_to_k_id;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	@Override
	public String toString() {
		return "BlackVO [u_from_id=" + u_from_id + ", u_to_id=" + u_to_id + ", u_from_k_id=" + u_from_k_id
				+ ", u_to_k_id=" + u_to_k_id + ", b_content=" + b_content + ", b_date=" + b_date + "]";
	}
	
	
	
}
