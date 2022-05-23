package com.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.health.dao.SpecialptDAO;
import com.health.dto.SpecialptDTO;

@Service("specialptService")
public class SpecialptServiceImpl implements SpecialptService {
	@Autowired
	@Qualifier("specialptdao")
	SpecialptDAO dao;

	@Override
	public int insertspecialpt(SpecialptDTO dto) {
		return dao.insertspecialpt(dto);
	}

	@Override
	public int checkspecialpt(int pu_num) {
		return dao.checkspecialpt(pu_num);
	}

	@Override
	public int updatescore(SpecialptDTO dto) {
		return dao.updatescore(dto);
	}
	
	@Override
	public List<SpecialptDTO> specialptlis(int page){
		int limit[]= new int[2];
		limit[0] = (page-1) * 20;
		limit[1] = 20;
		return dao.specialptlist(limit);
	}

	@Override
	public int checkspecialptlist() {
		return dao.checkspecialptlist();
	}
	
	
}
