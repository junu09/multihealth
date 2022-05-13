package com.health.dto;


public class PtuserDTO{
	int pu_num, pu_cm, pu_kg, pu_point, pu_target, m_num, pu_birthday;
	String pu_img;
	
	public PtuserDTO(){};
	
	public PtuserDTO(int m_num, int pu_cm, int pu_kg, int pu_target){
		
		this.m_num = m_num;
		this.pu_cm = pu_cm;
		this.pu_kg = pu_kg;
		this.pu_target = pu_target;
	}
	
	public PtuserDTO(int m_num, int pu_cm, int pu_kg, int pu_target, int pu_birthday,String pu_img){	
		this.m_num = m_num;
		this.pu_cm = pu_cm;
		this.pu_kg = pu_kg;
		this.pu_target = pu_target;
		this.pu_birthday = pu_birthday;
		this.pu_img = pu_img;
	}
	public int getPu_birthday() {
		return pu_birthday;
	}

	public void setPu_birthday(int pu_birthday) {
		this.pu_birthday = pu_birthday;
	}

	public String getPu_img() {
		return pu_img;
	}

	public void setPu_img(String pu_img) {
		this.pu_img = pu_img;
	}

	public int getPu_num() {
		return pu_num;
	}

	public void setPu_num(int pu_num) {
		this.pu_num = pu_num;
	}

	public int getPu_cm() {
		return pu_cm;
	}

	public void setPu_cm(int pu_cm) {
		this.pu_cm = pu_cm;
	}

	public int getPu_kg() {
		return pu_kg;
	}

	public void setPu_kg(int pu_kg) {
		this.pu_kg = pu_kg;
	}

	public int getPu_point() {
		return pu_point;
	}

	public void setPu_point(int pu_point) {
		this.pu_point = pu_point;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getPu_target() {
		return pu_target;
	}

	public void setPu_target(int pu_target) {
		this.pu_target = pu_target;
	}
	
}
