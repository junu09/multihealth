package com.health.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.health.dao.WorkoutDAO;
import com.health.dto.WorkoutDTO;
 

@Service("workoutservice")
public class WorkoutServiceImpl implements WorkoutService {
	@Autowired
	@Qualifier("workoutdao")
	WorkoutDAO dao;
	
	public int insertworkout(WorkoutDTO dto){
		return dao.insertworkout(dto);
	};
	
	public int oneweek(int pu_num){
		return dao.oneweek(pu_num);
	};
	
	public int point(int pu_num) {
		return dao.point(pu_num);
	};
	
	public int pu_targetadd(int pu_num) {
		return dao.pu_targetadd(pu_num);
	};
	
	public List<String> pu_targetday(int pu_num){
		return dao.pu_targetday(pu_num);
	};
	
	public List<Integer> pr_numall(int pu_num){
		return dao.pr_numall(pu_num);
	}
	
	public int workoutpagelistcheck(int pu_num) {
		return dao.workoutpagelistcheck(pu_num);
	}
	
	public List<WorkoutDTO> workoutpagelist(HashMap<String, Object> map){
		return dao.workoutpagelist(map);
	}
	
	
}
