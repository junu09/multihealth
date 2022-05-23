package com.health.service;

import java.util.List;

import org.springframework.ui.Model;

import com.health.dto.AdminDTO;
import com.health.dto.AnnounceDTO;
import com.health.dto.ReviewDTO;

public interface AnnounceService {

	public int execute(Model model,String pagenum, String contentnum);
	
	public int detail(Model model, String anum);
	
	public int announceinsert(AnnounceDTO adto);
	
	public int announcedelete(String a_num);
}
