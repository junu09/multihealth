package com.health.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.health.dto.AdminDTO;
import com.health.dto.ProductDTO;
import com.health.dto.ReviewDTO;

public interface ReviewService {

	
	public int execute(Model model,String pagenum, String contentnum, String categorynum);
	
	public int search(Model model,String pagenum, String contentnum, String categorynum, String search);
	
	public int ablereviewlist(Model model, String pagenum, String contentnum, int m_num);
	
	public int ablereviewmod(Model model, String pagenum, String contentnum, int m_num);
	
	public int ablereviewdel(Model model, String pagenum, String contentnum, int m_num);
	
	public int insertreviewform(Model model, String prod_num, int m_num);
	
	public int insertreview(ReviewDTO rdto);
	
	public int deletereview(ReviewDTO rdto);
	
	public List<ProductDTO> listAll2(String result);
	
	
}
