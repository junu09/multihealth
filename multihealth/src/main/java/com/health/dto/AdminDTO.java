package com.health.dto;

import org.springframework.web.multipart.MultipartFile;

public class AdminDTO {
	String prod_num;
	String category_num;
	String prod_title;
	String prod_price;
	String prod_inventory;
	MultipartFile prod_img;
	MultipartFile prod_description;
	String view_count;
	String prod_point;
	String prod_img_name;
	String prod_description_name;
	
	public String getProd_description_name() {
		return prod_description_name;
	}
	public void setProd_description_name(String prod_description_name) {
		this.prod_description_name = prod_description_name;
	}
	public String getProd_point() {
		return prod_point;
	}
	public void setProd_point(String prod_point) {
		this.prod_point = prod_point;
	}
	public String getProd_img_name() {
		return prod_img_name;
	}
	public void setProd_img_name(String prod_img_name) {
		this.prod_img_name = prod_img_name;
	}

	public String getProd_num() {
		return prod_num;
	}
	public void setProd_num(String prod_num) {
		this.prod_num = prod_num;
	}
	public String getCategory_num() {
		return category_num;
	}
	public void setCategory_num(String category_num) {
		this.category_num = category_num;
	}
	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_inventory() {
		return prod_inventory;
	}
	public void setProd_inventory(String prod_inventory) {
		this.prod_inventory = prod_inventory;
	}
	
	public MultipartFile getProd_img() { 
		return prod_img; 
	}
	public void setProd_img(MultipartFile prod_img) {
		this.prod_img = prod_img;
	}
	public MultipartFile getProd_description() {
		return prod_description;
	}
	public void setProd_description(MultipartFile prod_description) {
		this.prod_description = prod_description;
	}
	public String getView_count() {
		return view_count;
	}
	public void setView_count(String view_count) {
		this.view_count = view_count;
	}
	
	public AdminDTO(String prod_num, String category_num, String prod_title, String prod_price, String prod_inventory,
			MultipartFile prod_img, MultipartFile prod_description, String view_count, String prod_point,
			String prod_img_name, String prod_description_name) {
		super();
		this.prod_num = prod_num;
		this.category_num = category_num;
		this.prod_title = prod_title;
		this.prod_price = prod_price;
		this.prod_inventory = prod_inventory;
		this.prod_img = prod_img;
		this.prod_description = prod_description;
		this.view_count = view_count;
		this.prod_point = prod_point;
		this.prod_img_name = prod_img_name;
		this.prod_description_name = prod_description_name;
	}
	public AdminDTO() {};
	
}
