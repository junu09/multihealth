package com.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.AdminDTO;
import com.health.dto.ProductDTO;
 
@Mapper
@Repository("admindao") 
public interface AdminDAO {
	public int insertProduct(AdminDTO adto);
	public int updateProduct(AdminDTO adto);
	public int deleteProduct(AdminDTO adto);
	
	public List<AdminDTO> productlist();
	public AdminDTO product(int code);
	
	// .. select delete 등 추가해야함
	
	
	public List<ProductDTO> testlist(int pagenum, int contentnum);
	public List<ProductDTO> testlist2(int pagenum, int contentnum, int categorynum);
	public int testcount();
	public int testcount2(int categorynum);
	
	public AdminDTO modifysetting(int productnum);
	
	
}
