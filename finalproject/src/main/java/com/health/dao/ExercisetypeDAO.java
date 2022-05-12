package com.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.ExercisetypeDTO;



@Mapper //sql매핑파일 id명 동일 메소드 실행 가능
@Repository("exercisetypedao")
public interface ExercisetypeDAO {
	public List<ExercisetypeDTO> exercisetypelist();
	public List<ExercisetypeDTO> exercisetypemain();
	public List<ExercisetypeDTO> exercisetypesubpage();
	public List<ExercisetypeDTO> exercisetyperesssearch(String[] et_ename);
	public ExercisetypeDTO exercisetypename(String et_ename);
	public ExercisetypeDTO exercisetypenum(int et_num);
}

