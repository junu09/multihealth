package com.health.dto;


public class SpecialptDTO{
	int specialpt_num, pu_num;
	double specialpt_score;
	String m_name;
	
	public SpecialptDTO(){}
	
	public SpecialptDTO(double specialpt_score, int pu_num, String m_name){
		this.specialpt_score = specialpt_score;
		this.pu_num = pu_num;
		this.m_name = m_name;
	}

	public int getSpecialpt_num() {
		return specialpt_num;
	}

	public void setSpecialpt_num(int specialpt_num) {
		this.specialpt_num = specialpt_num;
	}

	public int getPu_num() {
		return pu_num;
	}

	public void setPu_num(int pu_num) {
		this.pu_num = pu_num;
	}

	public double getSpecialpt_score() {
		return specialpt_score;
	}

	public void setSpecialpt_score(double specialpt_score) {
		this.specialpt_score = specialpt_score;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
}
