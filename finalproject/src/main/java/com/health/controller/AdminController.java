package com.health.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
import com.health.service.AdminService;
import com.health.service.CategoryService;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("adminservice")
	AdminService service;
	
	@Autowired
	@Qualifier("categoryservice")
	CategoryService cservice;
	
		
	@RequestMapping(value="/admin/admininsert", method=RequestMethod.GET)
	public ModelAndView insertform() {
		ModelAndView mv= new ModelAndView();
		List<CategoryDTO> clist = cservice.categorylistnotall();
		mv.addObject("categorylist", clist);
		mv.setViewName("admin/insertform");
		return mv;
	}
	@RequestMapping(value="/admin/insertresult", method=RequestMethod.POST)
	public ModelAndView insertresult(@ModelAttribute AdminDTO adto, @RequestParam(defaultValue = "category_num") String categorynum) throws IOException {
		MultipartFile mf1 = adto.getProd_img();
		MultipartFile mf2 = adto.getProd_description();
		
		//String savePath = "c:/upload/";
		//String loadPath = "http://localhost:8081/upload/";
		String savePath = "/usr/mydir/upload/";
		String loadPath = "http://49.50.164.132:8080/upload/";
		
		
		if(!mf1.isEmpty()) {
			String originname1 = mf1.getOriginalFilename();
			String beforeext1 = originname1.substring(0, originname1.indexOf("."));
			String ext1 = originname1.substring(originname1.indexOf("."));
			String route1 = beforeext1+"("+UUID.randomUUID().toString()+")"+ext1;
			File serverfile1 = new File(savePath + route1); 
			mf1.transferTo(serverfile1);
			adto.setProd_img_name("<p><img class='card-img rounded-0 img-fluid' src=" + loadPath + route1 + "></p>");
		}
		if(!mf2.isEmpty()) {
			String originname2 = mf2.getOriginalFilename();
			String beforeext2 = originname2.substring(0, originname2.indexOf("."));
			String ext2 = originname2.substring(originname2.indexOf("."));
			String route2 = beforeext2+"("+UUID.randomUUID().toString()+")"+ext2;
			File serverfile2 = new File(savePath + route2); 
			mf2.transferTo(serverfile2);
			adto.setProd_description_name("<p style='text-align: center;' align='center'><br><img src="+ loadPath + route2 +"><br></p>");
		}
		int result = service.insertProduct(adto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("admin/insertresult");
		return mv;
	}

	@RequestMapping(value="/admin/adminselect")
	public ModelAndView adminselect(Model model,@RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum, @RequestParam(defaultValue = "category_num") String categorynum) throws Exception{
		ModelAndView mv= new ModelAndView();
		service.execute(model, pagenum, contentnum, categorynum);
		List<CategoryDTO> clist = cservice.categorylist();
		mv.addObject("categorylist", clist);
		mv.setViewName("admin/adminselect");
		return mv;
	}
	@RequestMapping(value="/admin/adminselect", method=RequestMethod.POST)
	public ModelAndView admindelete(Model model,@ModelAttribute AdminDTO adto, @RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum, @RequestParam(defaultValue = "category_num") String categorynum) throws Exception {
		ModelAndView mv = new ModelAndView();
		service.execute(model, pagenum, contentnum, categorynum);
		List<CategoryDTO> clist = cservice.categorylist();
		mv.addObject("categorylist", clist);
		mv.setViewName("admin/adminselect");
		return mv;
	}
	@RequestMapping(value="/admin/adminmodify")
	public ModelAndView adminmodifysetting(Model model, int productnum) throws Exception{
		ModelAndView mv = new ModelAndView();
		AdminDTO adto = service.modifysetting(productnum);
		List<CategoryDTO> clist = cservice.categorylistnotall();
		mv.addObject("categorylist", clist);
		mv.addObject("admindto", adto);
		mv.setViewName("admin/adminmodify");
		return mv;
	}
	@RequestMapping(value="/admin/adminmodify", method=RequestMethod.POST)
	public ModelAndView adminmodify(@ModelAttribute AdminDTO adto, String prod_img_before, String prod_description_before, int productnum) throws Exception{
		MultipartFile mf1 = adto.getProd_img();
		MultipartFile mf2 = adto.getProd_description();
		//String savePath = "c:/upload/";
		//String loadPath = "http://localhost:8081/upload/";
		String savePath = "/usr/mydir/upload/";
		String loadPath = "http://49.50.164.132:8080/upload/";

		if(!mf1.isEmpty()) {
			String originname1 = mf1.getOriginalFilename();
			String beforeext1 = originname1.substring(0, originname1.indexOf("."));
			String ext1 = originname1.substring(originname1.indexOf("."));
			String route1 = beforeext1+"("+UUID.randomUUID().toString()+")"+ext1;
			File serverfile1 = new File(savePath + route1); 
			mf1.transferTo(serverfile1);
			adto.setProd_img_name("<p><img class='card-img rounded-0 img-fluid' src=" + loadPath + route1 + "></p>");
		}
		else {
			adto.setProd_img_name(prod_img_before);
		}
		if(!mf2.isEmpty()) {
			String originname2 = mf2.getOriginalFilename();
			String beforeext2 = originname2.substring(0, originname2.indexOf("."));
			String ext2 = originname2.substring(originname2.indexOf("."));
			String route2 = beforeext2+"("+UUID.randomUUID().toString()+")"+ext2;
			File serverfile2 = new File(savePath + route2); 
			mf2.transferTo(serverfile2);
			adto.setProd_description_name("<p style='text-align: center;' align='center'><br><img src="+ loadPath + route2 +"><br></p>");
			System.out.println(adto.getProd_description_name());
		}
		else {
			adto.setProd_description_name(prod_description_before);
		}

		int result = service.updateProduct(adto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("admin/adminmodify");
		return mv;
	}
	@RequestMapping(value="/admin/admindelete")
	public ModelAndView admindelete(@ModelAttribute AdminDTO adto, Model model, @RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum, @RequestParam(defaultValue = "category_num") String categorynum, String productnum) throws Exception{
		ModelAndView mv = new ModelAndView();
		adto.setProd_num(productnum);
		int result = service.deleteProduct(adto);
		service.execute(model, pagenum, contentnum, categorynum);
		List<CategoryDTO> clist = cservice.categorylist();
		mv.addObject("categorylist", clist);
		mv.setViewName("admin/adminselect");
		return mv;
	}
}
