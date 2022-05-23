package com.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.AdminDTO;
import com.health.dto.AnnounceDTO;
import com.health.dto.ProductDTO;
import com.health.dto.ReviewDTO;

@Mapper
@Repository("announcedao") 
public interface AnnounceDAO {
//	public int insertProduct(AdminDTO adto);
//	public int updateProduct(AdminDTO adto);
//	public int deleteProduct(AdminDTO adto);
//	
	//public List<AdminDTO> productlist();
	//public AdminDTO product(int code);
	
	// .. select delete 등 추가해야함
	
	
	public List<AnnounceDTO> announcelist(int pagenum, int contentnum);
	public int announcecount();
	
	public AnnounceDTO announcedetail(int anum);
	
	public int insertAnnounce(AnnounceDTO adto);
	
	public int announcedelete(int a_num);
}
