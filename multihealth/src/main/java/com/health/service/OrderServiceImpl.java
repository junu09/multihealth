package com.health.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.health.dao.OrderDAO;
import com.health.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public void insertCartList(OrderDTO order) {
		orderDAO.insertOrder(order);		
	}

	@Override
	public void cartPayment(OrderDTO order, int prod_num) throws Exception {
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("order", order);
		mapParam.put("prod_num", prod_num);
		orderDAO.cart_payment(mapParam);
		
	}
	

}
