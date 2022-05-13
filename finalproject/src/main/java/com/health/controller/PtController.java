package com.health.controller;

import java.util.ArrayList;
import java.util.Enumeration;
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
import org.springframework.web.servlet.ModelAndView;

import com.health.dto.ExercisetypeDTO;
import com.health.dto.MemberDTO;
import com.health.dto.PtroutineDTO;
import com.health.dto.PtroutineoneDTO;
import com.health.dto.PtuserDTO;
import com.health.dto.WorkoutDTO;
import com.health.service.ExercisetypeService;
import com.health.service.PtroutineService;
import com.health.service.PtroutineoneService;
import com.health.service.PtuserService;
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
	
//================ptservice 메인 페이지=========================== 
	
	@RequestMapping(value="ptservice/ptmain", method = RequestMethod.GET)
	public ModelAndView ptmain() {
				
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		//ptuserservice에 가입을 확인
		int check = ptuserservice.ptusercheck(m_num);
		
		ModelAndView mv = new ModelAndView();
		//가입여부에 따라 리턴 페이지를 다르게함
		if(check==0) {
		//유저정보가 없을 경우 가입페이지로 이동
			mv.setViewName("ptservice/insertptuser");
		
		//가입정보가 있다면 ptmain 페이지로 이동  
		}else {
			//ptuser의 정보를 담아서 전달 
			String m_user =principal.getM_name();
			mv.addObject("m_user", m_user);
			PtuserDTO user = ptuserservice.ptuser(m_num);
			mv.addObject("pt_user", user);
			
			int pu_num = user.getPu_num();
			
			//ptuser의 이번달 목표를 가져와 이번달 운동량 대비 퍼센트지를 계산하는 부분 
			int pu_target = user.getPu_target();
			int pu_targetadd = workoutservice.pu_targetadd(pu_num);			
			if(pu_targetadd == 0){
				mv.addObject("percent", 0);
				mv.addObject("add_day", 0);
			//ptuser의 운동횟수가 존재한다면 운동한 날짜도 같이 보냄  
			}else if(pu_target<=pu_targetadd) {
					mv.addObject("percent", 100);
					List<String> day =workoutservice.pu_targetday(pu_num);
					mv.addObject("add_day", day);
			}else {
				double a = ((double)pu_targetadd / (double)pu_target * 100);
				int percent = (int)a;
				mv.addObject("percent", percent);
				List<String> day =workoutservice.pu_targetday(pu_num);
				mv.addObject("add_day", day);
			}
			mv.setViewName("ptservice/ptmain");
		}
		return mv;
	}
//================ptservice 회원가입 페이지=========================== 
	
	@RequestMapping(value="ptservice/insertptuser", method = RequestMethod.GET)
	public String ptuser() {
		
			return "ptservice/insertptuser";
	}
	
	@RequestMapping(value="ptservice/insertptuser", method = RequestMethod.POST)
	public String insertptuser(String pu_kg, String pu_cm, String pu_target) {
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		//새로운 유저 정보를 담을 PtuserDTO객체를 생성
		PtuserDTO newuser = new PtuserDTO();
		newuser.setM_num(m_num);
		newuser.setPu_kg(Integer.parseInt(pu_kg));
		newuser.setPu_cm(Integer.parseInt(pu_cm));
		newuser.setPu_target(Integer.parseInt(pu_target));
		ptuserservice.insertptuser(newuser);
		
		//가입이 완료되면 ptmain페이지로 돌아감 
		return "redirect:ptmain";
	}

//================ptservice 회원정보 수정=========================== 
	@RequestMapping(value="ptservice/saveasptuser", method = RequestMethod.GET)
	public String saveasptuser() {
		return "ptservice/saveasptuser";
	}
	
	@RequestMapping(value="ptservice/saveasptuser", method = RequestMethod.POST)
	public String saveasptuser(String pu_kg, String pu_cm, String pu_target) {
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		PtuserDTO newuser = new PtuserDTO();
		newuser.setM_num(m_num);
		newuser.setPu_kg(Integer.parseInt(pu_kg));
		newuser.setPu_cm(Integer.parseInt(pu_cm));
		newuser.setPu_target(Integer.parseInt(pu_target));
		ptuserservice.updateuser(newuser);
		return "redirect:ptmain";
	}	
	
//================ptservice 루틴생성 페이지=========================== 	
	
	@RequestMapping(value="ptservice/exerciselist", method = RequestMethod.GET)
	public ModelAndView ptlist() {
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		//모든 운동목록을 뽑아서 담음
		ModelAndView mv = new ModelAndView();
		List<ExercisetypeDTO> list = exercisetypeservice.exercisetypelist();
		//로그인한 유저의 정보를 뽑아 kcal 계산을 위한 몸무게를 전달함
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int user_kg = user.getPu_kg();
		mv.addObject("exercisetypelist", list);
		mv.addObject("user_kg", user_kg);
		mv.setViewName("ptservice/exercisetypelist");
		return mv;
	}
	
	//선택한 운동을 ajax로 보내 상단에 표시되도록 함
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
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		//유저 id를 통해 루틴 등록에 필요한 pu_num 정보를 받아옴	
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		
		//받아온 운동정보를 각각 배열에 담음 
		String pr_info = request.getParameter("pr_info");
		String [] et_ename = request.getParameterValues("et_ename");
		String [] et_name = request.getParameterValues("et_name");
		String [] pr_count = request.getParameterValues("pr_count");
		String pr_allkcal = request.getParameter("pr_allkcal");
		String pr_alltime = request.getParameter("pr_alltime");
		
		//ptroutine_table 생성부분 
		PtroutineDTO routine = new PtroutineDTO();
		routine.setPr_info(pr_info);
 		routine.setPu_num(pu_num);
 		routine.setPr_allkcal(Integer.parseInt(pr_allkcal));
 		routine.setPr_alltime(Integer.parseInt(pr_alltime));
 		ptroutineservice.insertptroutine(routine);
 		
 		//ptroutineone_table 생성부분 
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
	
//================ptservice 루틴리스트 페이지===========================
	
	//루틴리스트를 보여줄 유저 정보를 보내줌 
	@RequestMapping(value="ptservice/ptroutinelist" )
	public ModelAndView insertresultto() {
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		//ptuser정보를 전달함 
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ptservice/ptroutinelist");		
		return mv;
	}
	//루틴리스트를 전달함
	@RequestMapping(value="ptservice/routinelist", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<PtroutineDTO> insertresult(){
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		//루틴의 삭제 여부에 따라 루틴 리스트를 리턴함
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		List<PtroutineDTO> list = ptroutineservice.ptroutine(pu_num);
		return list;
	}
	//삭제리스트를 받아 루틴을 삭제함 
	@RequestMapping(value="ptservice/deletepr", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int deleterotine(String delete_rt){
		//루틴의 라벨 번호를 받아 삭제함 
		int delete = Integer.parseInt(delete_rt);
		int a = ptroutineservice.deleteptroutine(delete);
		return a;
	}
	
//================ptservice 루틴 시작===========================
	
	@RequestMapping(value="ptservice/startpt", method = RequestMethod.GET)
	public ModelAndView routinestart(String pt){
		//pt정보 불러옴 정보를 불러옴 
		int pr_num = Integer.parseInt(pt.substring(2));
		/**/
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> list = ptroutineoneservice.ptroutinepickjoin(pr_num);
		mv.addObject("pick", list);
		mv.setViewName("ptservice/startpt");
		
		return mv;
	}
	
	//루틴 마친 후 workout 테이블에 기록과 포인트 적립 여부 판단 
	@RequestMapping(value="ptservice/ptroutinesave", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String ptroutinesave(String datetime, String pr_num){
		//유저 id
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
		workout.setPu_num(pu_num);
		workout.setWorkout_time(datetime);
		workout.setPr_info(pr_info);
		if(oneweek >= 6 &&  point == 0) {
			workout.setWorkout_point(50);
			workoutservice.insertworkout(workout);
			ptuserservice.updatepoint(pu_num);
			return "{\"ms\":\"50 포인트가 적립되었습니다.\"}";
		}else{
			workout.setWorkout_point(0);
			workoutservice.insertworkout(workout);
			return "{\"ms\":\"운동이 완료되었습니다\"}";
		}
	}
	
	//================Specialpt 스쿼드 갯수 카운트=========================== 
	//목표 횟수를 받아옴 
	@RequestMapping(value="ptservice/specialpt", method = RequestMethod.GET)
	public ModelAndView speciaptstart(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ptservice/specialpt");	
		return mv;
	}
	
	//횟수를 뿌려주고 티처블 머신과 연결함
	@RequestMapping(value="ptservice/specialpt", method = RequestMethod.POST)
	public ModelAndView specialroutinestart(String ptcount){
		int count = Integer.parseInt(ptcount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ptcount", count);
		mv.setViewName("ptservice/startspecialpt");	
		return mv;
	}
	
}





