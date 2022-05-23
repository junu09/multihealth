package com.health.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.health.dto.SpecialptDTO;

 

@Mapper //sql매핑파일 id명 동일 메소드 실행 가능
@Repository("specialptdao")
public interface SpecialptDAO{
	public int insertspecialpt(SpecialptDTO dto);
	public int checkspecialpt(int pu_num);
	public int updatescore(SpecialptDTO dto);
	public List<SpecialptDTO> specialptlist(int[] limit);
	public int checkspecialptlist();
}
