package com.health.dto;


public class PtroutineDTO {
	int pr_num, pu_num ,pr_allkcal ,pr_alltime;
	String pr_info;
	
	public PtroutineDTO(){};
	public PtroutineDTO(String pr_info, int pu_num, int pr_allkcal, int pr_alltime){
		this.pr_info = pr_info;
		this.pu_num = pu_num;
		this.pr_allkcal = pr_allkcal;
		this.pr_alltime = pr_alltime;
	}
	public int getPr_num() {
		return pr_num;
	}
	public void setPr_num(int pr_num) {
		this.pr_num = pr_num;
	}
	public int getPu_num() {
		return pu_num;
	}
	public void setPu_num(int pu_num) {
		this.pu_num = pu_num;
	}
	public int getPr_allkcal() {
		return pr_allkcal;
	}
	public void setPr_allkcal(int pr_allkcal) {
		this.pr_allkcal = pr_allkcal;
	}
	public int getPr_alltime() {
		return pr_alltime;
	}
	public void setPr_alltime(int pr_alltime) {
		this.pr_alltime = pr_alltime;
	}
	public String getPr_info() {
		return pr_info;
	}
	public void setPr_info(String pr_info) {
		this.pr_info = pr_info;
	}
	
}
