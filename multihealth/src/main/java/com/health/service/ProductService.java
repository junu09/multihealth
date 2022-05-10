package com.health.service;

import java.util.List;

import org.springframework.ui.Model;

import com.health.dto.ProductDTO;

public interface ProductService {
	
	public int selectPrice(int prod_num) throws Exception;
	
	// 상품 디테일 페이지 
	
	public ProductDTO getproduct(int num) throws Exception;

	public int execute(Model model,String pagenum, String contentnum)throws Exception;

	public int execute(Model model, String pagenum, String contentnum, String categorynum)throws Exception;

	public List<ProductDTO> selectList(String search_text)throws Exception;





	
}

