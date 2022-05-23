package com.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.health.BoardPager;
import com.health.dao.AdminDAO;
import com.health.dao.CategoryDAO;
import com.health.dto.AdminDTO;
import com.health.dto.CategoryDTO;
import com.health.dto.ProductDTO;
 
@Service("categoryservice")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	@Qualifier("categorydao")
	CategoryDAO cdao;

	@Override
	public List<CategoryDTO> categorylist() {
		return cdao.categorylist();
	}
	@Override
	public List<CategoryDTO> categorylistnotall() {
		return cdao.categorylistnotall();
	}
	

}
