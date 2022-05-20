package com.health.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.health.dto.AdminDTO;
import com.health.dto.CategoryDTO;
import com.health.dto.MemberDTO;
import com.health.service.AdminService;
import com.health.service.AnnounceService;
import com.health.service.CategoryService;
import com.health.service.ReviewService;

@Controller
public class AnnounceController {
	
	@Autowired
	@Qualifier("announceservice")
	AnnounceService service;
	
		
	@RequestMapping(value="/announce/announcelist", method=RequestMethod.GET)
	public ModelAndView reviewlist(Model model,@RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum, @RequestParam(defaultValue = "category_num") String categorynum) throws Exception{
		ModelAndView mv= new ModelAndView();

		service.execute(model, pagenum, contentnum);
		mv.setViewName("announce/announcelist");
		return mv;
	}

}
