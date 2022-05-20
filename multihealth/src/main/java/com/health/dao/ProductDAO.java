package com.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.ProductDTO;

	@Repository
	@Mapper
	public interface ProductDAO {
		
		// 서비스 페이지 처리 총 상품 갯수 카운트
		
		public int selectList(String search_text) throws Exception;
		
		// 카운트 된 개수로 페이지 처리 
		
		public List<ProductDTO> testlist(int pagenum, int contentnum)throws Exception;
		public List<ProductDTO> testlist2(int pagenum, int contentnum, int categorynum)throws Exception;
		public int testcount()throws Exception;
		public int testcount2(int categorynum)throws Exception;
		
		

		public int selectPrice(int prod_num) throws Exception;
		public ProductDTO product(int prod_num)throws Exception;
		
		
	}

	