package com.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.AdminDTO;
import com.health.dto.CategoryDTO;
import com.health.dto.ProductDTO;

@Mapper
@Repository("categorydao") 
public interface CategoryDAO {
	public List<CategoryDTO> categorylist(); // 카테고리 (all 포함 o)
	public List<CategoryDTO> categorylistnotall(); // 카테고리 (all 포함 x)

	
	
	public List<ProductDTO> testlist(int pagenum, int contentnum);
	public int testcount();
	
}
