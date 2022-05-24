package com.health.service;
 
import java.util.List;

import com.health.dto.BmiDTO;


public interface BmiService{
	public List<BmiDTO> bmi(int age);
	
	
}
