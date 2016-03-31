package com.fleamarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.service.Service;
import com.fleamarket.vo.BoardVO;

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
		
		return "/main/main";
	}
	
	@RequestMapping("/info")
	public String goInfo() throws Exception {
		
		return "/main/info";
	}
	
	@RequestMapping("/fleamarket")
	public String goFleaMarket(Model model) throws Exception {
		
		List<BoardVO> list = service.selectList("board.selectBoardList",null);
		model.addAttribute("list",list);
		
		return "/fleamarket/fleamarketlist";
	}
	
	@RequestMapping("/notice")
	public String goNotice() throws Exception {
		
		return "/notice/noticelist";
	}
	
	@RequestMapping("/member/login")
	public String goLogin(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") != null) {
			return "redirect:/main";
		}
		return "/member/login";
	}
	
	@RequestMapping("/member/join")
	public String goJoin(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") != null) {
			return "redirect:/main";
		}
		return "/member/join";
	}
	
	@RequestMapping("/member/mypage")
	public String goMyPage(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		BoardVO vo = new BoardVO();
		vo.setMemId((String) req.getSession().getAttribute("sessionId"));
		vo.setBaType("WEAR");
		System.out.println("야" + vo.getMemId());
		System.out.println("야" + vo.getBaType());
		List<BoardVO> list = service.selectList("member.selectMyActive", vo);
		req.setAttribute("list", list);
		return "/member/mypage";
	}
}
