package com.health.dto;


public class PtuserDTO{
	int pu_num, pu_cm, pu_kg, pu_point, pu_target, m_num;	
	
	public PtuserDTO(){};
	
	public PtuserDTO(int m_num, int pu_cm, int pu_kg, int pu_target){
		this.m_num = m_num;
		this.pu_cm = pu_cm;
		this.pu_kg = pu_kg;
		this.pu_target = pu_target;
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
