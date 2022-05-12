package com.health.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.health.dao.PtroutineoneDAO;
import com.health.dto.PtroutineoneDTO;


@Service("ptroutineoneservice")
public class PtroutineoneServiceImpl implements PtroutineoneService {
	@Autowired
	@Qualifier("ptroutineonedao")
	PtroutineoneDAO dao;
	
	public int insertptroutineone(PtroutineoneDTO dto){
		return dao.insertptroutineone(dto);
	};
	
	public List<PtroutineoneDTO> ptroutinepick(int pr_num){
		return dao.ptroutinepick(pr_num);
	};
	public List<Map<String, Object>> ptroutinepickjoin(int pr_num){
		return dao.ptroutinepickjoin(pr_num);
	};
}
	
	
