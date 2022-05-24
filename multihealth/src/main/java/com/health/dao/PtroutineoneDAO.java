package com.health.dao;
 


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.health.dto.PtroutineoneDTO;



@Mapper //sql매핑파일 id명 동일 메소드 실행 가능
@Repository("ptroutineonedao")
public interface PtroutineoneDAO {
	public int insertptroutineone(PtroutineoneDTO dto);
	public List<PtroutineoneDTO> ptroutinepick(int pr_num);
	public List<Map<String, Object>> ptroutinepickjoin(int pr_num);
}

