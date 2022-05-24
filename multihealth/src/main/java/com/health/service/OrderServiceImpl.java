package com.health.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.health.dao.OrderDAO;
import com.health.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	@Qualifier("orderdao")
	OrderDAO orderDAO;

	@Override
	public void insertCartList(OrderDTO order) {
		System.out.println("serviceImpl");
		System.out.println(order.getProd_num());
		System.out.println(order.getM_num());
		System.out.println(order.getO_count());
		orderDAO.insertOrder(order);		
	}

	@Override
	public List<OrderDTO> orderDetail(int m_num) throws Exception {
		return orderDAO.orderdetailList(m_num);
	}



}
