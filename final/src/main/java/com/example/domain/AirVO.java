package com.example.domain;

import java.util.Date;

public class AirVO {
	private String a_number;
	private String a_company;
	private String a_startplace;
	private String a_endplace;
	private String a_starttime;
	private String a_endtime;
	private String a_runtime;
	private int a_price;
	private String a_startdate;
	private int a_emptyseat;
	
	public String getA_number() {
		return a_number;
	}
	public void setA_number(String a_number) {
		this.a_number = a_number;
	}
	public String getA_company() {
		return a_company;
	}
	public void setA_company(String a_company) {
		this.a_company = a_company;
	}
	public String getA_startplace() {
		return a_startplace;
	}
	public void setA_startplace(String a_startplace) {
		this.a_startplace = a_startplace;
	}
	public String getA_endplace() {
		return a_endplace;
	}
	public void setA_endplace(String a_endplace) {
		this.a_endplace = a_endplace;
	}
	public String getA_starttime() {
		return a_starttime;
	}
	public void setA_starttime(String a_starttime) {
		this.a_starttime = a_starttime;
	}
	public String getA_endtime() {
		return a_endtime;
	}
	public void setA_endtime(String a_endtime) {
		this.a_endtime = a_endtime;
	}
	public String getA_runtime() {
		return a_runtime;
	}
	public void setA_runtime(String a_runtime) {
		this.a_runtime = a_runtime;
	}
	public int getA_price() {
		return a_price;
	}
	public void setA_price(int a_price) {
		this.a_price = a_price;
	}
	public String getA_startdate() {
		return a_startdate;
	}
	public void setA_startdate(String a_startdate) {
		this.a_startdate = a_startdate;
	}
	public int getA_emptyseat() {
		return a_emptyseat;
	}
	public void setA_emptyseat(int a_emptyseat) {
		this.a_emptyseat = a_emptyseat;
	}
	@Override
	public String toString() {
		return "AirVO [a_number=" + a_number + ", a_company=" + a_company + ", a_startplace=" + a_startplace
				+ ", a_endplace=" + a_endplace + ", a_starttime=" + a_starttime + ", a_endtime=" + a_endtime
				+ ", a_runtime=" + a_runtime + ", a_price=" + a_price + ", a_startdate=" + a_startdate
				+ ", a_emptyseat=" + a_emptyseat + "]";
	}
}
