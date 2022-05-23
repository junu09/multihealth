package com.health.dto;
 
public class CartDTO {
	int cart_num;
	int m_num;
	int prod_num;
	int product_count;
	
	public CartDTO() {
	}
	
	
	public CartDTO(int cart_num, int m_num, int prod_num, int product_count) {
		this.cart_num = cart_num;
		this.m_num = m_num;
		this.prod_num = prod_num;
		this.product_count = product_count;
	}
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	
	
	
}
	
	