package com.health.service;

import java.util.List;

import org.springframework.ui.Model;

import com.health.dto.AdminDTO;
import com.health.dto.ReviewDTO;

public interface ReviewService {

	
	public List<ReviewDTO> reviewlist(); //매핑sql id 동일하지 않아도 된다

	
	public int execute(Model model,String pagenum, String contentnum, String categorynum);
}
