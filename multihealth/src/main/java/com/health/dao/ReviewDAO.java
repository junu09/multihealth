package com.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.AdminDTO;
import com.health.dto.OrderDTO;
import com.health.dto.ProductDTO;
import com.health.dto.ReviewDTO;
 
@Mapper
@Repository("reviewdao") 
public interface ReviewDAO {
	public List<ReviewDTO> reviewlist();
	public List<ReviewDTO> reviewlist2(int m_num);
	public ProductDTO product(int code);
	
	//public List<AdminDTO> productlist();
	//public AdminDTO product(int code);
	
	// .. select delete 등 추가해야함
	
	
	public List<ProductDTO> testlist(int pagenum, int contentnum);
	public List<ProductDTO> testlist2(int pagenum, int contentnum, int categorynum);
	public int testcount();
	public int testcount2(int categorynum);
	
	
	public List<OrderDTO> ablealllist(int m_num);
	public List<ReviewDTO> ablereviewmod(int pagenum, int contentnum, int m_num);
	
	public List<ReviewDTO> ablereviewdel(int pagenum, int contentnum, int m_num);
	
	public List<OrderDTO> ablereviewlist(int pagenum, int contentnum, int m_num);
	public int ablereviewcount(int m_num);
	
	public int insertreview(ReviewDTO rdto);
	
	public int deletereview(ReviewDTO rdto);
	
}
