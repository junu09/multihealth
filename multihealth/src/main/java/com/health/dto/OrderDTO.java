package com.health.dto;

import java.sql.Date;

public class OrderDTO {
	
	int o_num;
	int prod_num;
	int m_num;
	int o_count;
	
	public OrderDTO() {
	}
	
	public OrderDTO( int prod_num, int m_num, int o_count) {
		this.prod_num = prod_num;
		this.m_num = m_num;
		this.o_count = o_count;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getO_count() {
		return o_count;
	}

	public void setO_count(int o_count) {
		this.o_count = o_count;
	}
	
	
	

}
