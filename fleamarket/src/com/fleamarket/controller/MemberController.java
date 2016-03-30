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
		
		/*int login =  (int) service.selectOne("member.selectLoginSuccess", vo);
		if(login == 1){
			req.getSession().setAttribute("sessionId", vo.getMemId());
			return "SUCCESS";
		}*/
		
		MemberVO vo2 = (MemberVO) service.selectOne("member.selectMemberInfo", vo);
		if(vo2 == null)
			return "FAIL";
		else {
			req.getSession().setAttribute("sessionId", vo2.getMemId());
			req.getSession().setAttribute("sessionGrant", vo2.getMemGrant());
			return "SUCCESS";
		}
	}
}
