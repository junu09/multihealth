package com.health.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.health.dto.OrderDTO;

@Mapper
@Repository("orderdao")
public interface OrderDAO {

	
	//상품 주문
	public void insertOrder(OrderDTO order);

	public List<OrderDTO> orderdetailList(@Param(value = "m_num")int m_num) throws Exception;



}
