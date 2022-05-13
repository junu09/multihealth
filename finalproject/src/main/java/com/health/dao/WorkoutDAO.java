package com.health.dao;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.health.dto.WorkoutDTO;



@Mapper //sql매핑파일 id명 동일 메소드 실행 가능
@Repository("workoutdao")
public interface WorkoutDAO {
	public int insertworkout(WorkoutDTO dto);
	public int oneweek(int pu_num);
	public int point(int pu_num);
	public int pu_targetadd(int pu_num);
	public List<String> pu_targetday(int pu_num);
}

