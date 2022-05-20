package com.health.service;

import java.util.List;

import org.springframework.ui.Model;

import com.health.dto.AdminDTO;
import com.health.dto.CategoryDTO;

public interface CategoryService {
	
	public List<CategoryDTO> categorylist(); // 카테고리 (all 포함 o)
	public List<CategoryDTO> categorylistnotall(); // 카테고리 (all 포함 x)

}
