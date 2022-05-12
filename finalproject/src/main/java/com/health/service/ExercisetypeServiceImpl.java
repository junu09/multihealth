package com.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.health.dao.ExercisetypeDAO;
import com.health.dto.ExercisetypeDTO;


@Service("exercisetypeservice")
public class ExercisetypeServiceImpl implements ExercisetypeService {
	@Autowired
	@Qualifier("exercisetypedao")
	ExercisetypeDAO dao;


	@Override
	public List<ExercisetypeDTO>  exercisetypelist() {
		return dao.exercisetypelist();
	}
	
	@Override
	public List<ExercisetypeDTO> exercisetypemain(){
		return dao.exercisetypemain();
	};
	
	@Override
	public List<ExercisetypeDTO> exercisetypesubpage(){
		return dao.exercisetypesubpage();
	};

	@Override
	public List<ExercisetypeDTO>  exercisetyperesssearch(String[] et_ename) {
		return dao.exercisetyperesssearch(et_ename);
	}
	
	@Override
	public ExercisetypeDTO exercisetypename(String et_ename) {
		return dao.exercisetypename(et_ename);
	}
	
	@Override
	public ExercisetypeDTO exercisetypenum(int et_num) {
		return dao.exercisetypenum(et_num);
	}
}
