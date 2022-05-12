package com.health.service;

import java.util.List;

import com.health.dto.ExercisetypeDTO;


public interface ExercisetypeService{
	public List<ExercisetypeDTO> exercisetypelist();
	public List<ExercisetypeDTO> exercisetypemain();
	public List<ExercisetypeDTO> exercisetypesubpage();
	public List<ExercisetypeDTO>  exercisetyperesssearch(String[] et_ename);
	public ExercisetypeDTO exercisetypename(String et_ename);
	public ExercisetypeDTO exercisetypenum(int et_num);
	
	
}
