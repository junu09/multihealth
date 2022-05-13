package com.health.service;


import com.health.dto.PtuserDTO;


public interface PtuserService{
	public int insertptuser(PtuserDTO dto);
	public int insertptuser2(PtuserDTO dto);
	public PtuserDTO ptuser(int m_num);
	public int ptusercheck(int m_num);
	public int updateuser(PtuserDTO dto);
	public int updatepoint(int pu_num);
	
}
