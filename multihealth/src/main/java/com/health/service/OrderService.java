package com.health.service;

import java.util.List;

import com.health.dto.OrderDTO;

public interface OrderService {

	void insertCartList(OrderDTO order)throws Exception;

	List<OrderDTO> orderDetail(int m_num)throws Exception;

}
