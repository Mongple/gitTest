package com.fleamarket.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.service.Service;

@Controller
public class MainController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/")
	public String goMain() throws Exception {
		return "redirect:/main";
	}
	
	@RequestMapping("/main")
	public String goMain2() throws Exception {
		
		return "/WEB-INF/view/main/main.jsp";
	}
	
	@RequestMapping("/info")
	public String goInfo() throws Exception {
		
		return "/WEB-INF/view/main/info.jsp";
	}
	
	@RequestMapping("/fleamarket")
	public String goFleaMarket() throws Exception {
		
		return "/WEB-INF/view/fleamarket/fleamarketlist.jsp";
	}
	
	@RequestMapping("/notice")
	public String goNotice() throws Exception {
		
		return "/WEB-INF/view/notice/noticelist.jsp";
	}
	
	@RequestMapping("/login")
	public String goLogin() throws Exception {
		
		return "/WEB-INF/view/login/login.jsp";
	}
	
	@RequestMapping("/join")
	public String goJoin() throws Exception {
		
		return "/WEB-INF/view/login/join.jsp";
	}
}
