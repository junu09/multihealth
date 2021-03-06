package com.health.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.health.dto.BmiDTO;
import com.health.dto.ExercisetypeDTO;
import com.health.dto.MemberDTO;
import com.health.dto.PtroutineDTO;
import com.health.dto.PtroutineoneDTO;
import com.health.dto.PtuserDTO;
import com.health.dto.SpecialptDTO;
import com.health.dto.WorkoutDTO;
import com.health.service.BmiService;
import com.health.service.ExercisetypeService;
import com.health.service.PtroutineService;
import com.health.service.PtroutineoneService;
import com.health.service.PtuserService;
import com.health.service.SpecialptService;
import com.health.service.WorkoutService;

@Controller
public class PtController {
	@Autowired
	@Qualifier("exercisetypeservice")
	ExercisetypeService exercisetypeservice;
	
	@Autowired
	@Qualifier("ptroutineservice")
	PtroutineService ptroutineservice;
	
	@Autowired
	@Qualifier("ptuserservice")
	PtuserService ptuserservice;
	
	@Autowired
	@Qualifier("ptroutineoneservice")
	PtroutineoneService ptroutineoneservice;
	
	@Autowired
	@Qualifier("workoutservice")
	WorkoutService workoutservice;
	
	@Autowired
	@Qualifier("bmiservice")
	BmiService bmiservice;
	
	@Autowired
	@Qualifier("specialptService")
	SpecialptService specialptService; 
	
//================ptservice ?????? ?????????=========================== 
	
	
	@RequestMapping(value="ptservice/ptmain", method = RequestMethod.GET)
	public ModelAndView ptmain(){
				
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		//ptuserservice??? ????????? ??????
		int check = ptuserservice.ptusercheck(m_num);
		
		ModelAndView mv = new ModelAndView();
		//??????????????? ?????? ?????? ???????????? ????????????
		if(check==0) {
		//??????????????? ?????? ?????? ?????????????????? ??????
			mv.setViewName("ptservice/insertptuser");
		
		//??????????????? ????????? ptmain ???????????? ??????  
		}else {
			//ptuser??? ????????? ????????? ?????? 
			String m_user =principal.getM_name();
			mv.addObject("m_user", m_user);
			PtuserDTO user = ptuserservice.ptuser(m_num);
			mv.addObject("pt_user", user);
			int pu_num = user.getPu_num();
			
			
			//ptuser??? ????????? ????????? ????????? ????????? ????????? ?????? ??????????????? ???????????? ?????? 
			int pu_target = user.getPu_target();
			int pu_targetadd = workoutservice.pu_targetadd(pu_num);			
			if(pu_targetadd == 0){
				mv.addObject("percent", 0);
				mv.addObject("add_day", 0);
			//ptuser??? ??????????????? ??????????????? ????????? ????????? ?????? ??????  
			}else if(pu_target<=pu_targetadd) {
					mv.addObject("percent", 100);
					List<String> day =workoutservice.pu_targetday(pu_num);
					mv.addObject("add_day", day);
			}else {
				double percent  = ((double)pu_targetadd / (double)pu_target * 100);
				mv.addObject("percent", percent);
				List<String> day =workoutservice.pu_targetday(pu_num);
				mv.addObject("add_day", day);
			}
			//bmi?????? ????????? ??????
			double  bmiPu_cm = (user.getPu_cm()) * 0.01;
			double  a =((double)user.getPu_kg())/(bmiPu_cm*bmiPu_cm);
			String b ="";
			if(a<18.5) {
				b = "?????????";
			}else if(a<25.0){
				b = "????????????";
			}else if(a<30.0) {
				b = "??????1??????";
			}else if(a<40.0) {
				b="??????2??????";
			}else {
				b="??????3??????";
			}
			String bmi = String.format("%.1f", a);
			mv.addObject("bmi", bmi);
			mv.addObject("bmidefine", b);
			
			//??????????????? ????????? ?????????
			String pu_birthday =  Integer.toString(user.getPu_birthday());
			int birthYear = Integer.parseInt(pu_birthday.substring(0,4));
			int birthMonth =Integer.parseInt(pu_birthday.substring(4,6));
			int birthDay = Integer.parseInt(pu_birthday.substring(6));
			
			Calendar current = Calendar.getInstance();
			int currentYear  = current.get(Calendar.YEAR);
			int currentMonth = current.get(Calendar.MONTH) + 1;
			int currentDay   = current.get(Calendar.DAY_OF_MONTH);
			int age2 = 0;
			int age = currentYear - birthYear;
			// ?????? ??? ?????? ?????? -1
			if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {  
			      age--;}
			age2 = age;
			if(age<19) {
				age2 = 19;
			}else if(age>85) {
				age2=85;
			}
			
			mv.addObject("pt_userage", age);
			List<BmiDTO> bmilist =bmiservice.bmi(age2);
			mv.addObject("bmilist", bmilist);
			
			//????????? ?????? ?????? 
			List<Integer>  c = workoutservice.pr_numall(pu_num);
			HashMap<String,Integer> list = new HashMap<>();
			//????????? ??? ????????? ?????? ?????????
			for(int i = 0; i<c.size(); i++) {
				List<PtroutineoneDTO> ptonelist = ptroutineoneservice.ptroutinepick(c.get(i));
				for(int j = 0; j<ptonelist.size(); j++) {
					PtroutineoneDTO dto = ptonelist.get(j);
					Integer e = list.get(dto.getEt_ename());
					list.put(dto.getEt_ename(),dto.getPr_count());
					if(e != null) {
						list.put(dto.getEt_ename(),e+dto.getPr_count());
					}
				}
			}
			//????????? ??? ?????????????????? ??????????????? json ????????? ????????? 
			JsonObject partlistresult =new JsonObject();
			if(list.size() != 0) {
				HashMap<String,Integer> partlist = new HashMap<>();
				for( String key :list.keySet() ){
					Integer value = list.get(key);
					ExercisetypeDTO exdto = exercisetypeservice.exercisetypename(key);
					Integer test = partlist.get(exdto.getEt_part());
					if(test != null) {
						partlist.put(exdto.getEt_part(), test+value);
						partlistresult.addProperty(exdto.getEt_part(), test+value);
					}else {
						partlist.put(exdto.getEt_part(),value);
						partlistresult.addProperty(exdto.getEt_part(),value);
					}
				}	
				mv.addObject("partlistresult", partlistresult);
			}else {
				partlistresult.addProperty("??????????????????",100);
				mv.addObject("partlistresult", partlistresult);
			}
			
			
			//???????????? ?????? ?????? ??????
			int page = workoutservice.workoutpagelistcheck(pu_num);
			if(pu_num !=0) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("pu_num", pu_num);
				map.put("page1", 0);
				map.put("page2", 5);
				List<WorkoutDTO> workoutlist = workoutservice.workoutpagelist(map);
				mv.addObject("pagelist", workoutlist);
			}
			mv.addObject("page", page);
			mv.setViewName("ptservice/ptmain");
		}
		return mv;
	}
//================ptservice ?????? ????????? ???????????? ????????????==============================
	@RequestMapping(value="ptservice/ptmain", method=RequestMethod.POST , produces = {"application/json;charset=utf-8"} )
	@ResponseBody
	public List<WorkoutDTO> workoutpage(String page) {
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int user_num = user.getPu_num();
		int pageint = Integer.parseInt(page);
		int page1 = (pageint-1)*5;
		int page2 = 5;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pu_num", user_num);
		map.put("page1", page1);
		map.put("page2", page2);
		List<WorkoutDTO> workoutlist = workoutservice.workoutpagelist(map); 
		return workoutlist;
	}
	
//================ptservice ???????????? ?????????=========================== 
	
	@RequestMapping(value="ptservice/insertptuser", method = RequestMethod.GET)
	public String ptuser() {
		return "ptservice/insertptuser";
	}
	
	@RequestMapping(value="ptservice/insertptuser", method = RequestMethod.POST)
	public String insertptuser(PtuserDTO dto) throws IOException{
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		//????????? ?????? ????????? ?????? PtuserDTO????????? ??????
		PtuserDTO newuser = new PtuserDTO();
		
		//??????????????? ???????????? ?????? 
		MultipartFile pu_imgfile = dto.getPu_imgfile();
		String savePath = "c:/Users/junu9/upload/";
		
		if(!pu_imgfile.isEmpty()) {
			String originname = pu_imgfile.getOriginalFilename();
			//????????? ??????
			String ext2 = originname.substring(originname.indexOf("."));
			File serverfile1 = new File(savePath+"user"+m_num+ext2); 
			pu_imgfile.transferTo(serverfile1);
			newuser.setPu_img("user"+m_num+ext2);	
		}else {
			newuser.setPu_img("userbasic.jpg");	
		}		
		newuser.setM_num(m_num);
		newuser.setPu_birthday(dto.getPu_birthday());
		newuser.setPu_kg(dto.getPu_kg());
		newuser.setPu_cm(dto.getPu_cm());
		newuser.setPu_target(dto.getPu_target());
		ptuserservice.insertptuser(newuser);
		
		//????????? ???????????? ptmain???????????? ????????? 
		return "redirect:ptmain";
	}

//================ptservice ???????????? ??????=========================== 
	@RequestMapping(value="ptservice/saveasptuser", method = RequestMethod.GET)
	public ModelAndView saveasptuser() {
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		ModelAndView mv = new ModelAndView();
		PtuserDTO user = ptuserservice.ptuser(m_num);
		mv.addObject("pt_user", user);
		mv.setViewName("ptservice/saveasptuser");
		return mv;
	}
	
	@RequestMapping(value="ptservice/saveasptuser", method = RequestMethod.POST)
	public String saveasptuser(PtuserDTO dto) throws IOException{
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		//????????????????????? pt???????????? ?????????
		PtuserDTO ptuser= ptuserservice.ptuser(m_num);
		
		
		PtuserDTO updateUser = new PtuserDTO();
		
		updateUser.setM_num(m_num);
		//??????????????? ???????????? ?????? 
		MultipartFile pu_imgfile = dto.getPu_imgfile();
		String savePath = "c:/Users/junu9/upload/";
		
		if(!pu_imgfile.isEmpty()) {
			String originname = pu_imgfile.getOriginalFilename();
			//????????? ??????
			String ext2 = originname.substring(originname.indexOf("."));
			File serverfile1 = new File(savePath+"user"+m_num+ext2); 
			pu_imgfile.transferTo(serverfile1);
			updateUser.setPu_img("user"+m_num+ext2);	
		}else {
			updateUser.setPu_img(ptuser.getPu_img());	
		}	
		
		

		updateUser.setPu_target(dto.getPu_target());
		updateUser.setPu_cm(dto.getPu_cm());
		updateUser.setPu_kg(dto.getPu_kg());
		
		ptuserservice.updateuser(updateUser);
		return "redirect:ptmain";
	}	
	

	
//================ptservice ???????????? ?????????=========================== 	
	
	@RequestMapping(value="ptservice/exerciselist", method = RequestMethod.GET)
	public ModelAndView ptlist() {
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		//ptuserservice??? ????????? ??????
		int check = ptuserservice.ptusercheck(m_num);
		ModelAndView mv = new ModelAndView();
		if(check==0) {
			//??????????????? ?????? ?????? ?????????????????? ??????
				mv.setViewName("ptservice/insertptuser");
			
		}else {
		//?????? ??????????????? ????????? ??????
		List<ExercisetypeDTO> list = exercisetypeservice.exercisetypelist();
		//???????????? ????????? ????????? ?????? kcal ????????? ?????? ???????????? ?????????
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int user_kg = user.getPu_kg();
		mv.addObject("exercisetypelist", list);
		mv.addObject("user_kg", user_kg);
		mv.setViewName("ptservice/exercisetypelist");
		}
		return mv;
	}
	
	//????????? ????????? ajax??? ?????? ????????? ??????????????? ???
	@RequestMapping(value="ptservice/exerciselist", method=RequestMethod.POST , produces = {"application/json;charset=utf-8"} )
	@ResponseBody
	 public List<ExercisetypeDTO> init(HttpServletRequest request) {
		ArrayList<String> etlist = new ArrayList<>();
		Enumeration pick = request.getParameterNames();
		 while (pick.hasMoreElements()) {
		        String picket = (String)pick.nextElement();
		        etlist.add(picket);
		  }
		 String[] result = etlist.toArray(new String[0]);
		 List<ExercisetypeDTO> picklist = exercisetypeservice.exercisetyperesssearch(result);
		 return picklist;
	}
	
	@RequestMapping(value="ptservice/picklist", method = RequestMethod.POST)
	public String picklist(HttpServletRequest request) {
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		//?????? id??? ?????? ?????? ????????? ????????? pu_num ????????? ?????????	
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		
		//????????? ??????????????? ?????? ????????? ?????? 
		String pr_info = request.getParameter("pr_info");
		String [] et_ename = request.getParameterValues("et_ename");
		String [] et_name = request.getParameterValues("et_name");
		String [] pr_count = request.getParameterValues("pr_count");
		String pr_allkcal = request.getParameter("pr_allkcal");
		String pr_alltime = request.getParameter("pr_alltime");
		
		//ptroutine_table ???????????? 
		PtroutineDTO routine = new PtroutineDTO();
		routine.setPr_info(pr_info);
 		routine.setPu_num(pu_num);
 		routine.setPr_allkcal(Integer.parseInt(pr_allkcal));
 		routine.setPr_alltime(Integer.parseInt(pr_alltime));
 		ptroutineservice.insertptroutine(routine);
 		
 		//ptroutineone_table ???????????? 
 		PtroutineDTO serch = ptroutineservice.ptroutine_info(pr_info, pu_num);
 		int pr_num = serch.getPr_num();
		for(int i=0; i<et_ename.length; i++) {
			PtroutineoneDTO routineone = new PtroutineoneDTO();
			routineone.setPr_num(pr_num);
			routineone.setEt_ename(et_ename[i]);
			routineone.setPr_count(Integer.parseInt(pr_count[i]));
	 		ptroutineoneservice.insertptroutineone(routineone);
		};
		return "redirect:ptroutinelist";
	}
	
//================ptservice ??????????????? ?????????===========================
	
	//?????????????????? ????????? ?????? ????????? ????????? 
	@RequestMapping(value="ptservice/ptroutinelist" )
	public ModelAndView insertresultto() {
		
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		int check = ptuserservice.ptusercheck(m_num);
		ModelAndView mv = new ModelAndView();
		if(check==0) {
			//??????????????? ?????? ?????? ?????????????????? ??????
				mv.setViewName("ptservice/insertptuser");
			
		}else {
		//ptuser????????? ????????? 
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		mv.setViewName("ptservice/ptroutinelist");
		}
		return mv;
	}
	//?????????????????? ?????????
	@RequestMapping(value="ptservice/routinelist", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<PtroutineDTO> insertresult(){
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		//????????? ????????? ????????? ?????? ?????? ???????????? ?????????
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		List<PtroutineDTO> list = ptroutineservice.ptroutine(pu_num);
		return list;
	}
	//?????????????????? ?????? ????????? ???????????? ??? 
	@RequestMapping(value="ptservice/deletepr", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int deleterotine(String delete_rt){
		//????????? ?????? ????????? ?????? ????????? 
		int delete = Integer.parseInt(delete_rt);
		int a = ptroutineservice.deleteptroutine(delete);
		return a;
	}
	
//================ptservice ?????? ??????===========================
	
	@RequestMapping(value="ptservice/startpt", method = RequestMethod.GET)
	public ModelAndView routinestart(String pt){
		//pt?????? ????????? ????????? ????????? 
		int pr_num = Integer.parseInt(pt.substring(2));
		/**/
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> list = ptroutineoneservice.ptroutinepickjoin(pr_num);
		mv.addObject("pick", list);
		mv.setViewName("ptservice/startpt");
		
		return mv;
	}
	
	//?????? ?????? ??? workout ???????????? ????????? ????????? ?????? ?????? ?????? 
	@RequestMapping(value="ptservice/ptroutinesave", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String ptroutinesave(String datetime, String pr_num){
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
				
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		/**/
		int oneweek = workoutservice.oneweek(pu_num);
		int point = workoutservice.point(pu_num);
		int pru = Integer.parseInt(pr_num);
		PtroutineDTO Ptroutine = ptroutineservice.ptroutineprnum_info(pru);
		String pr_info = Ptroutine.getPr_info();
		WorkoutDTO workout = new WorkoutDTO();
		workout.setPr_num(pru);
		workout.setPu_num(pu_num);
		workout.setWorkout_time(datetime);
		workout.setPr_info(pr_info);
		if(oneweek >= 6 &&  point == 0) {
			workout.setWorkout_point(50);
			workoutservice.insertworkout(workout);
			ptuserservice.updatepoint(pu_num);
			return "{\"ms\":\"???????????? ?????????????????????.\"}";
		}else{
			workout.setWorkout_point(0);
			workoutservice.insertworkout(workout);
			return "{\"ms\":\"????????? ?????????????????????\"}";
		}
	}
	
	//================Specialpt ????????? ?????? ?????????=========================== 
	//?????? ????????? ????????? 
	@RequestMapping(value="ptservice/specialpt", method = RequestMethod.GET)
	public ModelAndView speciaptstart(){
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		PtuserDTO user = ptuserservice.ptuser(m_num);
		//
		int check = ptuserservice.ptusercheck(m_num);
		ModelAndView mv = new ModelAndView();
		if(check==0) {
			//??????????????? ?????? ?????? ?????????????????? ??????
				mv.setViewName("ptservice/insertptuser");
			
		}else {
		mv.setViewName("ptservice/specialpt");	
		int page = specialptService.checkspecialptlist();
		mv.addObject("pu_num", user.getPu_num());
		mv.addObject("page", page);
		}
		return mv;
	}
	
	
	//?????? ????????????
	@RequestMapping(value="ptservice/specialptranking", method=RequestMethod.POST , produces = {"application/json;charset=utf-8"} )
	@ResponseBody
	public List<SpecialptDTO> specialptrankingpage(String page) {
		//?????? id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		PtuserDTO user = ptuserservice.ptuser(m_num);
		//
		int paging = Integer.parseInt(page);
		List<SpecialptDTO> rankinglist =  specialptService.specialptlis(paging);	
		return rankinglist;
	}
	
	//????????? ???????????? ????????? ????????? ?????????
	@RequestMapping(value="ptservice/specialpt", method = RequestMethod.POST)
	public ModelAndView specialroutinestart(String ptcount){
		int count = Integer.parseInt(ptcount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ptcount", count);
		mv.setViewName("ptservice/startspecialpt");	
		return mv;
	}
	
	//????????? ?????? ????????? ????????? ??????
		@RequestMapping(value="ptservice/specialroutinesave", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
		@ResponseBody
		public void specialroutinesave(String time, String count){
			//?????? id
			MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int m_num = principal.getM_num();
			String m_name = principal.getM_name();
					
			PtuserDTO user = ptuserservice.ptuser(m_num);
			int pu_num = user.getPu_num();
			/**/
			int checkspecialpt = specialptService.checkspecialpt(pu_num);
			int ptcount = Integer.parseInt(count);
			double setSpecialpt_score = ((Double.parseDouble(time)/ptcount))/1000;
			setSpecialpt_score = Math.round(setSpecialpt_score * 100) / 100.0;
		
			if(checkspecialpt == 0) {
				SpecialptDTO specialptdto = new SpecialptDTO();
				specialptdto.setPu_num(pu_num);
				specialptdto.setM_name(m_name);
				specialptdto.setSpecialpt_score(setSpecialpt_score);
				specialptService.insertspecialpt(specialptdto);
			}else {
				SpecialptDTO specialptdto = new SpecialptDTO();
				specialptdto.setPu_num(pu_num);
				specialptdto.setM_name(m_name);
				specialptdto.setSpecialpt_score(setSpecialpt_score);
				specialptService.updatescore(specialptdto);
			}
		}
		
	
}





