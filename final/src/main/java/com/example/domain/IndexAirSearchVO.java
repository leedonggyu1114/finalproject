package com.example.domain;

public class IndexAirSearchVO {
	
	private String a_startplace;
	private String a_endplace;
	private String a_startdate;
	private String a_startdate1;
	private int people;
	private int child;
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
	public String getA_startdate() {
		return a_startdate;
	}
	public void setA_startdate(String a_startdate) {
		this.a_startdate = a_startdate;
	}
	public String getA_startdate1() {
		return a_startdate1;
	}
	public void setA_startdate1(String a_startdate1) {
		this.a_startdate1 = a_startdate1;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	@Override
	public String toString() {
		return "IndexAirSearchVO [a_startplace=" + a_startplace + ", a_endplace=" + a_endplace + ", a_startdate="
				+ a_startdate + ", a_startdate1=" + a_startdate1 + ", people=" + people + ", child=" + child + "]";
	}
	
	
}
