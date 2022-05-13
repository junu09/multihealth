package com.health.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	
	// 유저목록
	public List<MemberDTO> Userlist();

	// 유저 1인 읽어오기
	public MemberDTO readUser(String m_mail);

	// 유저 1인 권한 읽어오기
	public List<String> readAuthority(String m_mail);

	// 회원 가입
	public void createUser(MemberDTO dto);

	// 회원가입시 권한생성
	public void createAuthority(MemberDTO dto);

	// 비동기 이메일 체크
	public int checkEmail(String m_mail);

	// 회원 정보 수정
	public void updateMember(Map<String, Object> param);

	
	
	// 유저삭제
	public void deleteUser(String m_mail);

	// 유저권한삭제
	public void deleteAuthority(String m_mail);

}