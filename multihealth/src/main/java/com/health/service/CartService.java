package com.health.service;

import java.util.List;

import com.health.dto.CartDTO;
import com.health.dto.ProductDTO;

public interface CartService {

	List<CartDTO> cartQueryById(int m_num)throws Exception;

	ProductDTO prodQueryByProdNum(int prod_num)throws Exception;
	
	public void deleteCart(int prod_num, int m_num) throws Exception;

	void updateCart(int prod_num, int product_count, int m_num) throws Exception;

	void insertCart(int prod_num, int product_count, int m_num) throws Exception;

	void deleteCartAll(int m_num)throws Exception;



	


}
