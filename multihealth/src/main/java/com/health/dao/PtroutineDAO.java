package com.health.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.health.dto.PtroutineDTO;

 

@Mapper //sql매핑파일 id명 동일 메소드 실행 가능
@Repository("ptroutinedao")
public interface PtroutineDAO {
	public int insertptroutine(PtroutineDTO dto);
	public int deleteptroutine(int pr_num);
	public List<PtroutineDTO> ptroutine(int pu_num);
	public PtroutineDTO ptroutine_info(String pr_info ,int pu_num);
	public PtroutineDTO ptroutineprnum_info(int pr_num);
	
}

