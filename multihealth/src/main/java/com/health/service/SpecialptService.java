package com.health.service;

 
import java.util.List;

import com.health.dto.SpecialptDTO;

public interface SpecialptService{
	public int insertspecialpt(SpecialptDTO dto);
	public int checkspecialpt(int pu_num);
	public int updatescore(SpecialptDTO dto);
	public List<SpecialptDTO> specialptlis(int page);
	public int checkspecialptlist();
	
}
