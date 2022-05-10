package com.health.dto;

public class ProductDTO {
int prod_num;
int category_num;
String prod_title;
int prod_price;
int prod_inventory;
String prod_img_name;
String prod_description_name;
int view_count;
String prod_point;

public ProductDTO() {}

public ProductDTO(int prod_num, int category_num, String prod_title, int prod_price, int prod_inventory,
		String prod_img_name, String prod_description_name, int view_count, String prod_point) {
	
	this.prod_num = prod_num;
	this.category_num = category_num;
	this.prod_title = prod_title;
	this.prod_price = prod_price;
	this.prod_inventory = prod_inventory;
	this.prod_img_name = prod_img_name;
	this.prod_description_name = prod_description_name;
	this.view_count = view_count;
	this.prod_point = prod_point;
}


public int getProd_num() {
	return prod_num;
}


public void setProd_num(int prod_num) {
	this.prod_num = prod_num;
}


public int getCategory_num() {
	return category_num;
}


public void setCategory_num(int category_num) {
	this.category_num = category_num;
}


public String getProd_title() {
	return prod_title;
}


public void setProd_title(String prod_title) {
	this.prod_title = prod_title;
}


public int getProd_price() {
	return prod_price;
}


public void setProd_price(int prod_price) {
	this.prod_price = prod_price;
}


public int getProd_inventory() {
	return prod_inventory;
}


public void setProd_inventory(int prod_inventory) {
	this.prod_inventory = prod_inventory;
}


public String getProd_img_name() {
	return prod_img_name;
}


public void setProd_img_name(String prod_img_name) {
	this.prod_img_name = prod_img_name;
}


public String getProd_description_name() {
	return prod_description_name;
}


public void setProd_description_name(String prod_description_name) {
	this.prod_description_name = prod_description_name;
}


public int getView_count() {
	return view_count;
}


public void setView_count(int view_count) {
	this.view_count = view_count;
}


public String getProd_point() {
	return prod_point;
}


public void setProd_point(String prod_point) {
	this.prod_point = prod_point;
}

}




