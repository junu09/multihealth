package com.health.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.health.dto.AdminDTO;
import com.health.dto.CategoryDTO;
import com.health.dto.ExercisetypeDTO;
import com.health.dto.MemberDTO;
import com.health.dto.ProductDTO;
import com.health.dto.ReviewDTO;
import com.health.service.AdminService;
import com.health.service.CategoryService;
import com.health.service.ReviewService;
import com.nimbusds.jose.shaded.json.JSONArray;
import com.nimbusds.jose.shaded.json.JSONObject;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewservice")
	ReviewService service;
	
	@Autowired
	@Qualifier("categoryservice")
	CategoryService cservice;
	
		
	@RequestMapping(value="/review/reviewlist", method=RequestMethod.GET)
	public ModelAndView reviewlist(Model model,@RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum, @RequestParam(defaultValue = "category_num") String categorynum) throws Exception{
		ModelAndView mv= new ModelAndView();

		service.execute(model, pagenum, contentnum, categorynum);
		List<CategoryDTO> clist = cservice.categorylistnotall();
		mv.addObject("categorylist", clist);
		mv.setViewName("review/reviewlist");
		return mv;
	}
	
	@RequestMapping(value="/review/reviewinsertform", method=RequestMethod.GET)
	public ModelAndView reviewinsertform(Model model, String prod_num) throws Exception{
		ModelAndView mv= new ModelAndView();
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		
		service.insertreviewform(model, prod_num, m_num);
		mv.setViewName("review/reviewinsertform");
		return mv;
	}
	@RequestMapping(value="/review/ablereviewlist", method=RequestMethod.GET)
	public ModelAndView ablereviewlist(Model model, @RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum) throws Exception{
		ModelAndView mv= new ModelAndView();
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		service.ablereviewlist(model, pagenum, contentnum, m_num);
		mv.setViewName("review/ablereviewlist");
		return mv;
	}
	@RequestMapping(value="/review/ablereviewmod", method=RequestMethod.GET)
	public ModelAndView ablereviewmod(Model model,@RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum) throws Exception{
		ModelAndView mv= new ModelAndView();
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		service.ablereviewmod(model, pagenum, contentnum, m_num);
		mv.setViewName("review/ablereviewmod");
		return mv;
	}
	@RequestMapping(value="/review/ablereviewdel", method=RequestMethod.GET)
	public ModelAndView ablereviewdel(Model model,@RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum) throws Exception{
		ModelAndView mv= new ModelAndView();
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		service.ablereviewdel(model, pagenum, contentnum, m_num);
		mv.setViewName("review/ablereviewdel");
		return mv;
	}
	@RequestMapping(value="/review/reviewinsertresult", method=RequestMethod.POST)
	public ModelAndView reviewinsertresult(@ModelAttribute ReviewDTO rdto, Model model, @RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum) throws Exception{
		ModelAndView mv= new ModelAndView();
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		rdto.setM_num(Integer.toString(m_num));
		
		MultipartFile mf1 = rdto.getR_image();
		String savePath = "c:/upload/";
		String loadPath = "http://localhost:8081/upload/";
		
		if(!mf1.isEmpty()) {
			String originname1 = mf1.getOriginalFilename();
			String beforeext1 = originname1.substring(0, originname1.indexOf("."));
			String ext1 = originname1.substring(originname1.indexOf("."));
			String route1 = beforeext1+"("+UUID.randomUUID().toString()+")"+ext1;
			File serverfile1 = new File(savePath + route1); 
			mf1.transferTo(serverfile1);
			rdto.setR_image_name("<p><img class='card-img rounded-0 review-fluid' src=" + loadPath + route1 + "></p>");
		}

		int result = service.insertreview(rdto);
		service.ablereviewlist(model, pagenum, contentnum, m_num);
		mv.setViewName("review/ablereviewlist");
		return mv;
	}
	@RequestMapping(value="/review/reviewdelete", method=RequestMethod.GET)
	public ModelAndView reviewdelete(@ModelAttribute ReviewDTO rdto, Model model, @RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum, String rnum) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		rdto.setR_num(rnum);
		System.out.println("delete controller");
		System.out.println(rdto.getR_num());

		int result = service.deletereview(rdto);
		service.ablereviewdel(model, pagenum, contentnum, m_num);
		mv.setViewName("review/ablereviewdel");
		return mv;
	}
	
	@RequestMapping(value = "/autocomplete",  produces = "application/text; charset=utf8")
	@ResponseBody
	 public void AutoTest(Locale locale, Model model, HttpServletRequest request,
	 HttpServletResponse resp, ProductDTO dto) throws IOException {
	 String result = request.getParameter("term");
	 
	 List<ProductDTO> list = service.listAll2(result); //result값이 포함되어 있는 emp테이블의 네임을 리턴
	 
	 JSONArray ja = new JSONArray();
	 for (int i = 0; i < list.size(); i++) {
	 ja.add(list.get(i).getProd_title());
	 }
	 resp.setCharacterEncoding("UTF-8");
	 PrintWriter out = resp.getWriter();
	 
	 out.print(ja.toString());
	 System.out.println(ja.toString());
	 }
	@RequestMapping(value="/productsearch", method=RequestMethod.GET)
	public ModelAndView productsearch(Model model, @RequestParam(defaultValue = "1") String pagenum,@RequestParam(defaultValue = "9") String contentnum, @RequestParam(defaultValue = "category_num") String categorynum, String search) throws Exception{
		ModelAndView mv= new ModelAndView();
		service.search(model, pagenum, contentnum, categorynum ,search);
		List<CategoryDTO> clist = cservice.categorylist();
		mv.addObject("categorylist", clist);
		mv.setViewName("/productlist");
		return mv;
	}
}
