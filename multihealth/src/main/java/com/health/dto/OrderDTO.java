package com.health.dto;

import java.sql.Date;
 
public class OrderDTO {
	
	int o_num;
	int prod_num;
	int m_num;
	int o_count;
	Date o_date;
	String o_address;
	String o_state;
	
	public OrderDTO() {
	}
	
	public OrderDTO(int o_num, int prod_num, int m_num, int o_count, Date o_date, String o_address, String o_state) {
		super();
		this.o_num = o_num;
		this.prod_num = prod_num;
		this.m_num = m_num;
		this.o_count = o_count;
		this.o_date = o_date;
		this.o_address = o_address;
		this.o_state = o_state;
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

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public String getO_address() {
		return o_address;
	}

	public void setO_address(String o_address) {
		this.o_address = o_address;
	}

	public String getO_state() {
		return o_state;
	}
 
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	
	
	
	
	

}
