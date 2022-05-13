package com.health.dto;


public class PtroutineoneDTO{
	int po_num, pr_count, pr_num;
	String et_ename;
	
	public PtroutineoneDTO(){};
	
	public PtroutineoneDTO(int pr_num, String et_ename, int pr_count){
		this.pr_num = pr_num;
		this.et_ename = et_ename;
		this.pr_count = pr_count;
	}

	public int getPo_num() {
		return po_num;
	}

	public void setPo_num(int po_num) {
		this.po_num = po_num;
	}

	public int getPr_count() {
		return pr_count;
	}

	public void setPr_count(int pr_count) {
		this.pr_count = pr_count;
	}

	public int getPr_num() {
		return pr_num;
	}

	public void setPr_num(int pr_num) {
		this.pr_num = pr_num;
	}

	public String getEt_ename() {
		return et_ename;
	}

	public void setEt_ename(String et_ename) {
		this.et_ename = et_ename;
	};
	
}
