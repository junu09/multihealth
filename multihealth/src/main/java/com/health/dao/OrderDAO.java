package com.health.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.OrderDTO;

@Mapper
@Repository
public class OrderDAO {

	
	//상품 단품 주문
	public void insertOrder(OrderDTO order) {
		
	}

	public void cart_payment(Map<String, Object> mapParam) {
		
	}

	public void cart_payment2(Map<String, Object> mapParam) {
		 
	}

}
