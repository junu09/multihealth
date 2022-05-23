package com.health.dto;
 

public class ExercisetypeDTO {
	String et_name,et_ename,et_img1,et_img2,et_img3,et_description,et_part;

	int et_num, et_met,et_time,et_lv, ec_num;


	public ExercisetypeDTO(){};
	
	public ExercisetypeDTO(int et_num){
		this.et_num = et_num;
	};
	
	
	public int getEt_num() {
		return et_num;
	}

	public void setEt_num(int et_num) {
		this.et_num = et_num;
	}

	public String getEt_name() {
		return et_name;
	}

	public void setEt_name(String et_name) {
		this.et_name = et_name;
	}
	public String getEt_ename() {
		return et_ename;
	}

	public void setEt_ename(String et_ename) {
		this.et_ename = et_ename;
	}
	
	public String getEt_part() {
		return et_part;
	}

	public void setEt_part(String et_part) {
		this.et_part = et_part;
	}

	public String getEt_img1() {
		return et_img1;
	}

	public void setEt_img1(String et_img1) {
		this.et_img1 = et_img1;
	}

	public String getEt_img2() {
		return et_img2;
	}

	public void setEt_img2(String et_img2) {
		this.et_img2 = et_img2;
	}

	public String getEt_img3() {
		return et_img3;
	}

	public void setEt_img3(String et_img3) {
		this.et_img3 = et_img3;
	}

	public String getEt_description() {
		return et_description;
	}

	public void setEt_description(String et_description) {
		this.et_description = et_description;
	}

	public int getEt_met() {
		return et_met;
	}

	public void setEt_met(int et_met) {
		this.et_met = et_met;
	}

	public int getEt_time() {
		return et_time;
	}

	public void setEt_time(int et_time) {
		this.et_time = et_time;
	}

	public int getEt_lv() {
		return et_lv;
	}

	public void setEt_lv(int et_lv) {
		this.et_lv = et_lv;
	}

	public int getEc_num() {
		return ec_num;
	}

	public void setEc_num(int ec_num) {
		this.ec_num = ec_num;
	}
	
}
