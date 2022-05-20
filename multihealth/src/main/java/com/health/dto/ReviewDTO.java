package com.health.dto;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	String r_num;
	String m_num;
	String prod_num;
	MultipartFile r_image;
	String r_image_name;
	String r_point;
	String r_content;
	String r_date;

	
	public String getR_point() {
		return r_point;
	}
	public void setR_point(String r_point) {
		this.r_point = r_point;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getProd_num() {
		return prod_num;
	}
	public void setProd_num(String prod_num) {
		this.prod_num = prod_num;
	}
	public MultipartFile getR_image() {
		return r_image;
	}
	public void setR_image(MultipartFile r_image) {
		this.r_image = r_image;
	}
	public String getR_image_name() {
		return r_image_name;
	}
	public void setR_image_name(String r_image_name) {
		this.r_image_name = r_image_name;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	public ReviewDTO(String r_num, String m_num, String prod_num, MultipartFile r_image, String r_image_name,
			String r_point, String r_content, String r_date) {
		super();
		this.r_num = r_num;
		this.m_num = m_num;
		this.prod_num = prod_num;
		this.r_image = r_image;
		this.r_image_name = r_image_name;
		this.r_point = r_point;
		this.r_content = r_content;
		this.r_date = r_date;
	}
	public ReviewDTO() {};
	
}
