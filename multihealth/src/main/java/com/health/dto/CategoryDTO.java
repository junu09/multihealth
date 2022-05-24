package com.health.dto;
 
import org.springframework.web.multipart.MultipartFile;

public class CategoryDTO {
	String category_num, category_name;

	public String getCategory_num() {
		return category_num;
	}

	public void setCategory_num(String category_num) {
		this.category_num = category_num;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public CategoryDTO(String category_num, String category_name) {
		super();
		this.category_num = category_num;
		this.category_name = category_name;
	}
	public CategoryDTO() {}
}
