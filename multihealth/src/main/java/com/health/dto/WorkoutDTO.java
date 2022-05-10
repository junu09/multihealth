package com.health.dto;


public class WorkoutDTO{
	int workout_num, workout_point,pu_num;
	String workout_time,pr_info;
	
	public WorkoutDTO(){};
	
	public WorkoutDTO(String pr_info , int workout_point, String workout_time, int pu_num){
		this.pr_info = pr_info;
		this.workout_point = workout_point;
		this.workout_time = workout_time;
		this.pu_num = pu_num;
		
	}

	public int getWorkout_num() {
		return workout_num;
	}

	public void setWorkout_num(int workout_num) {
		this.workout_num = workout_num;
	}


	public String getPr_info() {
		return pr_info;
	}

	public void setPr_info(String pr_info) {
		this.pr_info = pr_info;
	}

	public int getWorkout_point() {
		return workout_point;
	}

	public void setWorkout_point(int workout_point) {
		this.workout_point = workout_point;
	}


	public int getPu_num() {
		return pu_num;
	}

	public void setPu_num(int pu_num) {
		this.pu_num = pu_num;
	}

	public String getWorkout_time() {
		return workout_time;
	}

	public void setWorkout_time(String workout_time) {
		this.workout_time = workout_time;
	};
	
	
	
}
