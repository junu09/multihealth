package com.health.service;

import java.util.HashMap;
import java.util.List;

import com.health.dto.WorkoutDTO;

public interface WorkoutService{
	public int insertworkout(WorkoutDTO dto);
	public int oneweek(int pu_num);
	public int point(int pu_num);
	public int pu_targetadd(int pu_num);
	public List<String> pu_targetday(int pu_num);
	public List<Integer> pr_numall(int pu_num);
	public int workoutpagelistcheck(int pu_num);
	public List<WorkoutDTO> workoutpagelist(HashMap<String, Object> map);
	
}
