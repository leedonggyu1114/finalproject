package com.example.domain;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class PassengersVO extends UserVO{
	private String payName;
	private String email;
	private String tel;
	private String u_birthday;
	private List<String> a_p_name;
	private List<String> a_p_gender;
	private List<String> a_p_residentregistration;
	private int a_emptyseat;
	private List<String> a_p_seat;
	private List<String> a_p_backseat;
	private int airsum;
	private String a_number;
	private String a_number1;
	private Date a_b_paydate;
	private String a_b_status;
	private int sum;
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getU_birthday() {
		return u_birthday;
	}
	public void setU_birthday(String u_birthday) {
		this.u_birthday = u_birthday;
	}
	public List<String> getA_p_name() {
		return a_p_name;
	}
	public void setA_p_name(List<String> a_p_name) {
		this.a_p_name = a_p_name;
	}
	public List<String> getA_p_gender() {
		return a_p_gender;
	}
	public void setA_p_gender(List<String> a_p_gender) {
		this.a_p_gender = a_p_gender;
	}
	public List<String> getA_p_residentregistration() {
		return a_p_residentregistration;
	}
	public void setA_p_residentregistration(List<String> a_p_residentregistration) {
		this.a_p_residentregistration = a_p_residentregistration;
	}
	public int getA_emptyseat() {
		return a_emptyseat;
	}
	public void setA_emptyseat(int a_emptyseat) {
		this.a_emptyseat = a_emptyseat;
	}
	public List<String> getA_p_seat() {
		return a_p_seat;
	}
	public void setA_p_seat(List<String> a_p_seat) {
		this.a_p_seat = a_p_seat;
	}
	public List<String> getA_p_backseat() {
		return a_p_backseat;
	}
	public void setA_p_backseat(List<String> a_p_backseat) {
		this.a_p_backseat = a_p_backseat;
	}
	public int getAirsum() {
		return airsum;
	}
	public void setAirsum(int airsum) {
		this.airsum = airsum;
	}
	public String getA_number() {
		return a_number;
	}
	public void setA_number(String a_number) {
		this.a_number = a_number;
	}
	public String getA_number1() {
		return a_number1;
	}
	public void setA_number1(String a_number1) {
		this.a_number1 = a_number1;
	}
	public Date getA_b_paydate() {
		return a_b_paydate;
	}
	public void setA_b_paydate(Date a_b_paydate) {
		this.a_b_paydate = a_b_paydate;
	}
	public String getA_b_status() {
		return a_b_status;
	}
	public void setA_b_status(String a_b_status) {
		this.a_b_status = a_b_status;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	@Override
	public String toString() {
		return "PassengersVO [payName=" + payName + ", email=" + email + ", tel=" + tel + ", u_birthday=" + u_birthday
				+ ", a_p_name=" + a_p_name + ", a_p_gender=" + a_p_gender + ", a_p_residentregistration="
				+ a_p_residentregistration + ", a_emptyseat=" + a_emptyseat + ", a_p_seat=" + a_p_seat
				+ ", a_p_backseat=" + a_p_backseat + ", airsum=" + airsum + ", a_number=" + a_number + ", a_number1="
				+ a_number1 + ", a_b_paydate=" + a_b_paydate + ", a_b_status=" + a_b_status + ", sum=" + sum + "]";
	}
	
	
	
}
