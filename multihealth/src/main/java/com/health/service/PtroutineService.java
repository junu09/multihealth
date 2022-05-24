package com.health.service;

import java.util.List;

import com.health.dto.PtroutineDTO;

 
public interface PtroutineService{
	public int insertptroutine(PtroutineDTO dto);
	public int deleteptroutine(int pr_num);
	public List<PtroutineDTO> ptroutine(int pu_num);
	public PtroutineDTO ptroutine_info(String pr_info ,int pu_num);
	public PtroutineDTO ptroutineprnum_info(int pr_num);
	
}
