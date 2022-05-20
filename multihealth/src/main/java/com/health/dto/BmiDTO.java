package com.health.dto;


public class BmiDTO {
	String bmi_gender;
	double bmi_lv1, bmi_lv2, bmi_lv3, bmi_lv4, bmi_lv5;
	int bmi_num, bmi_startage, bmi_endage;


	public BmiDTO(){}


	public String getBmi_gender() {
		return bmi_gender;
	}


	public void setBmi_gender(String bmi_gender) {
		this.bmi_gender = bmi_gender;
	}


	public double getBmi_lv1() {
		return bmi_lv1;
	}


	public void setBmi_lv1(double bmi_lv1) {
		this.bmi_lv1 = bmi_lv1;
	}


	public double getBmi_lv2() {
		return bmi_lv2;
	}


	public void setBmi_lv2(double bmi_lv2) {
		this.bmi_lv2 = bmi_lv2;
	}


	public double getBmi_lv3() {
		return bmi_lv3;
	}


	public void setBmi_lv3(double bmi_lv3) {
		this.bmi_lv3 = bmi_lv3;
	}


	public double getBmi_lv4() {
		return bmi_lv4;
	}


	public void setBmi_lv4(double bmi_lv4) {
		this.bmi_lv4 = bmi_lv4;
	}


	public double getBmi_lv5() {
		return bmi_lv5;
	}


	public void setBmi_lv5(double bmi_lv5) {
		this.bmi_lv5 = bmi_lv5;
	}


	public int getBmi_num() {
		return bmi_num;
	}


	public void setBmi_num(int bmi_num) {
		this.bmi_num = bmi_num;
	}


	public int getBmi_startage() {
		return bmi_startage;
	}


	public void setBmi_startage(int bmi_startage) {
		this.bmi_startage = bmi_startage;
	}


	public int getBmi_endage() {
		return bmi_endage;
	}


	public void setBmi_endage(int bmi_endage) {
		this.bmi_endage = bmi_endage;
	};		
	
}
