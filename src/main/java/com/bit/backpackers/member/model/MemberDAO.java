package com.bit.backpackers.member.model;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.compiler.ast.Member;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberDAO {

	//회원가입 처리
    void register(MemberVo memberVo) throws Exception;
    // 로그인 처리
    MemberVo login(LoginDTO loginDTO) throws Exception;
    //회원가입 아이디중복 중복체크 
    MemberVo idCheck(MemberVo memberVo) throws Exception;
    //아이디 찾기
    MemberVo findId(Map<String, Object> memberMap)throws Exception;
    //비밀번호 찾기
    MemberVo findPw(Map<String, Object> memberMap)throws Exception;
    //비밀번호 변경
    int modifyPw(MemberVo memberVo)throws Exception;   
    //회원탈퇴
 	public void delete(MemberVo memberVo)throws Exception;
 	//회원 수정
 	public void modify(MemberVo memberVo)throws Exception;
 	


    
}
