package com.health.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.health.dao.CartDAO;
import com.health.dto.CartDTO;
import com.health.dto.ProductDTO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO cartDao;
	 
	@Override
	public List<CartDTO> cartQueryById(int m_num) throws Exception {
		List<CartDTO> cartList = cartDao.cartQueryById(m_num);
		return cartList;
	}

	@Override
	public ProductDTO prodQueryByProdNum(int prod_num) throws Exception {
		return cartDao.prodQueryByProdNum(prod_num);
	}
	
	@Override
	public void insertCart(int prod_num, int product_count, int m_num) throws Exception {/* , int product_count */
		Map<String, Object> cartParam = new HashMap<String, Object>();
		cartParam.put("prod_num", prod_num);
		cartParam.put("m_num", m_num);
		System.out.println(m_num + "servcieimpl");

		cartParam.put("product_count", product_count);
		//cartParam.put("product_count", product_count);
		cartDao.insertCart(cartParam);
	}
	
	@Override
	public void updateCart(int prod_num, int product_count, int m_num) throws Exception {
		Map<String, Object> cartParam = new HashMap<String, Object>();
		cartParam.put("prod_num", prod_num);
		cartParam.put("m_num", m_num);
		cartParam.put("product_count", product_count);
		cartDao.updateQuan(cartParam);
	}

	@Override
	public void deleteCart(int prod_num, int m_num) throws Exception {
		Map<String, Object> cartParam = new HashMap<String, Object>();
		cartParam.put("prod_num", prod_num);
		cartParam.put("m_num", m_num);
		cartDao.deleteCart(cartParam);
	}

	@Override
	public void deleteCartAll(int m_num) throws Exception {
		cartDao.deleteCartAll(m_num);
		
	}


	}


