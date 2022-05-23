package com.health.service;
 
import java.util.List;

import org.springframework.ui.Model;

import com.health.dto.AdminDTO;

public interface AdminService {
	public int insertProduct(AdminDTO adto);
	public int updateProduct(AdminDTO adto);
	public int deleteProduct(AdminDTO adto);
	public List<AdminDTO> productlist(); //매핑sql id 동일하지 않아도 된다
	public AdminDTO product(int code);
	
	public AdminDTO modifysetting(int productnum);
	public int modify(String productnum);
	
	public int execute(Model model,String pagenum, String contentnum, String categorynum);
}
