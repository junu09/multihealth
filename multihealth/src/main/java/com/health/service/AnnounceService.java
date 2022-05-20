package com.health.service;

import java.util.List;

import org.springframework.ui.Model;

import com.health.dto.AdminDTO;
import com.health.dto.ReviewDTO;

public interface AnnounceService {

	public int execute(Model model,String pagenum, String contentnum);
}
