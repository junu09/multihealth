package com.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.health.dao.BmiDAO;
import com.health.dto.BmiDTO;


@Service("bmiservice")
public class BmiServiceImpl implements  BmiService{
	@Autowired
	@Qualifier("bmidao")
	BmiDAO dao;

	@Override
	public List<BmiDTO> bmi(int age) {
		return dao.bmi(age);
	}
	
	
	
}
