package com.health.service;

import com.health.dto.OrderDTO;

public interface OrderService {

	void insertCartList(OrderDTO order)throws Exception;
	
	void cartPayment(OrderDTO order, int prod_num) throws Exception;



}
