package com.health.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.health.dao.PtroutineDAO;
import com.health.dto.PtroutineDTO;


@Service("ptroutineservice")
public class PtroutineServiceImpl implements PtroutineService {
	@Autowired
	@Qualifier("ptroutinedao")
	PtroutineDAO dao;
	
	public int insertptroutine(PtroutineDTO dto) {
		return dao.insertptroutine(dto);
	};
	public int deleteptroutine(int pr_num) {
		return dao.deleteptroutine(pr_num);
	};
	public List<PtroutineDTO> ptroutine(int pu_num) {
		return dao.ptroutine(pu_num);
	};
	public PtroutineDTO ptroutine_info(String pr_info ,int pu_num){
		return dao.ptroutine_info(pr_info, pu_num);
	};
	public PtroutineDTO ptroutineprnum_info(int pr_num) {
		return dao.ptroutineprnum_info(pr_num);
	};
}
	
	
