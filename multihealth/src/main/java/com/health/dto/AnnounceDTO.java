package com.health.dto;

import org.springframework.web.multipart.MultipartFile;
 
public class AnnounceDTO {
	String a_num;
	String a_title;
	String a_content;
	String a_date;
	String a_count;

	

	public AnnounceDTO(String a_num, String a_title, String a_content, String a_date, String a_count) {
		super();
		this.a_num = a_num;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_date = a_date;
		this.a_count = a_count;
	}



	public String getA_num() {
		return a_num;
	}



	public void setA_num(String a_num) {
		this.a_num = a_num;
	}



	public String getA_title() {
		return a_title;
	}



	public void setA_title(String a_title) {
		this.a_title = a_title;
	}



	public String getA_content() {
		return a_content;
	}



	public void setA_content(String a_content) {
		this.a_content = a_content;
	}



	public String getA_date() {
		return a_date;
	}



	public void setA_date(String a_date) {
		this.a_date = a_date;
	}



	public String getA_count() {
		return a_count;
	}



	public void setA_count(String a_count) {
		this.a_count = a_count;
	}



	public AnnounceDTO() {};
	
}
