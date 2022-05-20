package com.health.service;

import java.util.List;
import java.util.Map;

import com.health.dto.PtroutineoneDTO;


public interface PtroutineoneService{
	public int insertptroutineone(PtroutineoneDTO dto);
	public List<PtroutineoneDTO> ptroutinepick(int pr_num);
	public List<Map<String, Object>> ptroutinepickjoin(int pr_num);
}
