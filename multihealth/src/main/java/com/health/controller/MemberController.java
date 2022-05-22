package com.health.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.health.dto.ExercisetypeDTO;
import com.health.dto.MemberDTO;
import com.health.service.ExercisetypeService;
import com.health.service.MemberServiceImpl;
import com.health.valid.Validator;

@Controller
public class MemberController {

	@Autowired
	MemberServiceImpl memberservice;

	@Autowired
	Validator valid;

	@Autowired
	@Qualifier("exercisetypeservice")
	ExercisetypeService exercisetypeservice;

	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		List<ExercisetypeDTO> list = exercisetypeservice.exercisetypemain();
		mv.addObject("exercisetypelist", list);
		mv.setViewName("/index");
		return mv;
	}

	// 회원가입 페이지
	@GetMapping("/user/signup")
	public String dispSignup() {
		return "signup";
	}

	// 회원가입 처리
	@PostMapping("/user/signup")
	public String execSignup(@Validated MemberDTO dto, Errors errors, Model model) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("USER"));
		dto.setAuthorities(authorities);

		if (errors.hasErrors()) {
			// 회원가입 실패시 입력데이터를 유지
			model.addAttribute("dto", dto);
			// 유효성 통과못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = valid.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}

			// return "/user/signup";
		}
		memberservice.createUser(dto);
		return "redirect:/user/loginPage";

	}

	// 로그인 페이지
	@RequestMapping(value = "/user/loginPage")
	public String dispLogin() {
		return "login";
	}

	// 로그인 결과 페이지
	@GetMapping("/user/login/result")
	public String dispLoginResult() {
		return "index"; // loginSuccess
	}

	// 로그아웃 결과 페이지
	@GetMapping("/user/logout/result")
	public String dispLogout() {
		return "index";
	}

	// 접근 거부 페이지
	@GetMapping("/user/denied")
	public String dispDenied() {
		return "denied";
	}

	// 내 정보 페이지
	@GetMapping("/user/info")
	public String memberview(String id, Model model) {
		model.addAttribute("dto", memberservice.getInfo(id));
		return "myinfo";
	}


	// 회원가입 비동기 이메일체크
	@ResponseBody
	@PostMapping("/checkEmail")
	public int checkEmail(String m_mail) {
		int result = memberservice.checkEmail(m_mail);
		return result;
	}

	// 약관동의 페이지 오픈
	@GetMapping("/agreement")
	public String agreement() {
		return "agreement";
	}

	// 회원정보 변경 페이지 오픈
	@GetMapping("/user/info/infoupdate")
	public String dispupdate() {
		return "infoupdate";
	}

	// 회원정보 변경 결과값 반환
	@PostMapping("/user/info/infoupdate/result")
	public @ResponseBody boolean update(@RequestBody Map<String, Object> param) {
		boolean result = memberservice.updateUser(param);
		return result;
	}
	
	
	// 회원탈퇴
	@GetMapping("/user/leave")
	public String leave(@AuthenticationPrincipal MemberDTO dto, Model model, HttpServletResponse response) {
		model.addAttribute("dto", dto.getAuthorities());
		return "leave";
	}
	
	@PostMapping("/user/leave")
	public void leave(@AuthenticationPrincipal MemberDTO dto, @RequestParam String m_mail, Model model, HttpSession session, HttpServletResponse response) throws Exception{
		memberservice.deleteUser(m_mail);
		SecurityContextHolder.clearContext();
		session.invalidate();
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out;
		out = response.getWriter();
		out.println("<script> alert('정상적으로 회원탈퇴 되었습니다.'); location.href='/'; </script>");
		out.flush();		
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/user/naverLogin")
	public String naverLogin() {
		return "naverLogin";
	}
	
		
}