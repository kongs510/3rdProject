package com.bit.backpackers.member.controller;

import java.lang.reflect.Member;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.backpackers.member.Interceptor.AdminInterceptor;
import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.member.service.MemberService;

import common.exception.MailException;

@Controller
@RequestMapping("/user")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	private final MemberService memberService;

	@Inject
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		logger.info("login");
		return "/user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(@ModelAttribute LoginDTO loginDTO, HttpSession httpSession, RedirectAttributes rttr)
			throws Exception {
		logger.info("loginPost");
		MemberVo user = memberService.login(loginDTO);

		if (user != null) {
			System.out.println("로그인 성공");

			httpSession.setAttribute("user", user);
			httpSession.setAttribute("username",loginDTO.getUserId());
			return "redirect:/";
		}
		System.out.println("로그인 실패");
		httpSession.setAttribute("user", null);

		return "user/login";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	// 마이페이지 이동
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String mypage(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		logger.info("user Login");
		return "/user/myPage";
	}

	// 회원가입페이지 이동
	@RequestMapping(value = { "/register" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String registerGET() throws Exception {
		System.out.println("회원가입페이지 이동");
		return "user/register";
	}

	// 회원가입
	@RequestMapping(value = "/registerPost", method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute MemberVo memberVo, RedirectAttributes redirectAttributes)
			throws Exception {
		memberService.register(memberVo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");

		System.out.println("회원가입 완료");
		return "/user/registerPost";
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@ModelAttribute MemberVo memberVo) throws Exception {
		int result = memberService.idCheck(memberVo);
		System.out.println("login check");
		return result;
	}

	// 아이디찾기 이동
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String getFindId() {
		// System.out.println("findid Call");

		return "/user/findid";
	}

	// 아이디찾기
	@RequestMapping(value = "/findidAjax")
	@ResponseBody
	public String findId(@RequestParam Map<String, Object> memberMap) throws Exception {
		MemberVo memberVo = memberService.findId(memberMap);
		String result = "fail";

		if (memberVo != null) {
			String res = memberVo.getUserId();
			System.out.println(res);

			if (res.equals(null)) {
				return "fail";
			}
			result = memberVo.getUserId();
		}
		return result;
	}

	// 비밀번호 찾기 이동
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String getFindPw() {
		// System.out.println("findpw Call");

		return "/user/findpw";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findpwAjax")
	@ResponseBody
	public String FindPw(@RequestParam Map<String, Object> memberMap) throws Exception {

		MemberVo memberVo = memberService.findPw(memberMap);
		String result = "";

		if (memberVo != null) {
			String res = memberVo.getUserPw();

			if (res.equals(null)) {
				return "null";
			}
			result = memberVo.getUserPw();
		}
		return result;
	}

	// 비밀번호 변경
	@RequestMapping("/pwModify")
	public ModelAndView modifyPw(MemberVo memberVo) throws Exception {

		ModelAndView mav = new ModelAndView();

		int res = memberService.modifyPw(memberVo);

		if (res < 0) {
			System.out.println("비밀번호 수정 실패");
			mav.setViewName("redirect:findpw");
		} else {
			System.out.println("비밀번호 수정 성공");
			mav.setViewName("redirect:login");
		}

		return mav;
	}

	// 메일발송
	@RequestMapping("/send")
	public ModelAndView joinEmailCheck(String email, int code_check) throws MailException {
		ModelAndView mav = new ModelAndView();

		this.memberService.mailSending(email, code_check);

		System.out.println("메일 발송 성공");

		return mav;
	}
	//회원정보 수정 이동	 
	  @RequestMapping(value = "/registerEdit", method = RequestMethod.GET)
	  public void ModifyGET() { 
	logger.info("Modify"); 
	} 
	// 회원정보 수정
	@RequestMapping(value = "/registerEdit", method = RequestMethod.POST)
	public String postModify(@ModelAttribute LoginDTO loginDTO, HttpSession session, MemberVo memberVo)
			throws Exception {
		logger.info("post modify");

		MemberVo user = memberService.login(loginDTO);
		session.setAttribute("user", user);

		memberService.modify(memberVo);

		session.invalidate();

		return "/user/login";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "user/delete";
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String Delete(MemberVo memberVo, HttpSession session, RedirectAttributes rttr) throws Exception {

		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		MemberVo user = (MemberVo) session.getAttribute("user");
		// 세션에있는 비밀번호
		String sessionPass = user.getUserPw();
		// vo로 들어오는 비밀번호
		String voPass = memberVo.getUserPw();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/delete";
		}
		memberService.delete(memberVo);
		session.invalidate();
		return "redirect:/";
	}
}