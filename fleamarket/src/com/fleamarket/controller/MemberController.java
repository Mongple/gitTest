package com.fleamarket.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fleamarket.service.Service;
import com.fleamarket.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/member/loginSign")
	@ResponseBody
	public String loginSign(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {

		MemberVO vo2 = (MemberVO) service.selectOne("member.selectMemberInfo", vo);
		if(vo2 == null)
			return "FAIL";
		else {
			req.getSession().setAttribute("sessionId", vo2.getMemId());
			req.getSession().setAttribute("sessionGrant", vo2.getMemGrant());
			return "SUCCESS";
		}
	}
	
	@RequestMapping("/member/logout")
	public String logout(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		req.getSession().invalidate();
		
		return "redirect:/main";
	}
	
	/*
	 * 회원가입
	*/
	@RequestMapping("/member/insertMember")
	public String insertMember(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		if(service.insert("member.insertMember", vo) != 0) {
			logger.debug("가입완료");
			return "redirect:/main";
		}
		return "";
	}
	
	/*
	 * ID Check
	*/
	@RequestMapping("/member/idCheck")
	@ResponseBody
	public String idCheck(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		
		vo = (MemberVO) service.selectOne("member.idCheck", vo);
		
		if(vo == null) {
			logger.debug("중복없음");
			return "c";
		}
		else {
			logger.debug("중복");
			return "cc";
		}
	}
	
}
