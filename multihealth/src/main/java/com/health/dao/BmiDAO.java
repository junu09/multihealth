package com.health.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.health.dto.BmiDTO;
 
@Mapper //sql매핑파일 id명 동일 메소드 실행 가능
@Repository("bmidao")
public interface BmiDAO {
	public List<BmiDTO>	bmi(int age);
}
