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
import com.health.dto.WorkoutDTO;
import com.health.service.BmiService;
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
	
	@Autowired
	@Qualifier("bmiservice")
	BmiService bmiservice;
	
//================ptservice 메인 페이지=========================== 
	
	
	@RequestMapping(value="ptservice/ptmain", method = RequestMethod.GET)
	public ModelAndView ptmain(){
				
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
				double percent  = ((double)pu_targetadd / (double)pu_target * 100);
				mv.addObject("percent", percent);
				List<String> day =workoutservice.pu_targetday(pu_num);
				mv.addObject("add_day", day);
			}
			//bmi지수 구하는 부분
			double  bmiPu_cm = (user.getPu_cm()) * 0.01;
			double  a =((double)user.getPu_kg())/(bmiPu_cm*bmiPu_cm);
			String b ="";
			if(a<18.5) {
				b = "저체중";
			}else if(a<25.0){
				b = "정상체중";
			}else if(a<30.0) {
				b = "비만1단계";
			}else if(a<40.0) {
				b="비만2단계";
			}else {
				b="비만3단계";
			}
			String bmi = String.format("%.1f", a);
			mv.addObject("bmi", bmi);
			mv.addObject("bmidefine", b);
			
			//생년월일로 만나이 구하기
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
			// 생일 안 지난 경우 -1
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
			
			//이번달 운동 부위 
			List<Integer>  c = workoutservice.pr_numall(pu_num);
			HashMap<String,Integer> list = new HashMap<>();
			//이번달 한 운동과 횟수 가져옴
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
			//이번달 한 운동부위별로 횟수넣어서 json 객체로 저장함 
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
				partlistresult.addProperty("운동목록없음",100);
				mv.addObject("partlistresult", partlistresult);
			}
			
			
			//운동기록 존재 여부 확인
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
//================ptservice 메인 페이지 운동기록 확인하기==============================
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
	
//================ptservice 회원가입 페이지=========================== 
	
	@RequestMapping(value="ptservice/insertptuser", method = RequestMethod.GET)
	public String ptuser() {
		return "ptservice/insertptuser";
	}
	
	@RequestMapping(value="ptservice/insertptuser", method = RequestMethod.POST)
	public String insertptuser(PtuserDTO dto) throws IOException{
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		
		//새로운 유저 정보를 담을 PtuserDTO객체를 생성
		PtuserDTO newuser = new PtuserDTO();
		
		//이미지파일 존재여부 확인 
		MultipartFile pu_imgfile = dto.getPu_imgfile();
		String savePath = "c:/Users/junu9/upload/";
		if(!pu_imgfile.isEmpty()) {
			String originname = pu_imgfile.getOriginalFilename();
			//확장자 이후
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
		
		//가입이 완료되면 ptmain페이지로 돌아감 
		return "redirect:ptmain";
	}

//================ptservice 회원정보 수정=========================== 
	@RequestMapping(value="ptservice/saveasptuser", method = RequestMethod.GET)
	public ModelAndView saveasptuser() {
		//유저 id
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
		//유저 id
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		//유저정보토대로 pt유저정보 불러옴
		PtuserDTO ptuser= ptuserservice.ptuser(m_num);
		
		
		PtuserDTO updateUser = new PtuserDTO();
		
		updateUser.setM_num(m_num);
		//이미지파일 존재여부 확인 
		MultipartFile pu_imgfile = dto.getPu_imgfile();
		String savePath = "c:/Users/junu9/upload/";
		
		if(!pu_imgfile.isEmpty()) {
			String originname = pu_imgfile.getOriginalFilename();
			//확장자 이후
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
		//루틴의 활성화 여부에 따라 루틴 리스트를 리턴함
		PtuserDTO user = ptuserservice.ptuser(m_num);
		int pu_num = user.getPu_num();
		List<PtroutineDTO> list = ptroutineservice.ptroutine(pu_num);
		return list;
	}
	//삭제리스트를 받아 루틴을 비활성화 함 
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
		workout.setPr_num(pru);
		workout.setPu_num(pu_num);
		workout.setWorkout_time(datetime);
		workout.setPr_info(pr_info);
		if(oneweek >= 6 &&  point == 0) {
			workout.setWorkout_point(50);
			workoutservice.insertworkout(workout);
			ptuserservice.updatepoint(pu_num);
			return "{\"ms\":\"포인트가 적립되었습니다.\"}";
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





