package com.fleamarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.service.Service;
import com.fleamarket.vo.BoardVO;
import com.fleamarket.vo.MemberVO;

@Controller
public class AdminController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/admin/adminMain/rate")
	public String viewAdminRate(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		MemberVO vo = new MemberVO();
		BoardVO vo2 = new BoardVO();
		
		vo = (MemberVO) service.selectOne("member.selectUserCount", vo);
		req.setAttribute("user", vo);
		
		vo = (MemberVO) service.selectOne("member.selectAdminCount", vo);
		req.setAttribute("admin", vo);
		
		vo2 = (BoardVO) service.selectOne("board.selectNoticeCount", vo2);
		req.setAttribute("notice", vo2);
		
		vo2 = (BoardVO) service.selectOne("board.selectWearCount", vo2);
		req.setAttribute("wear", vo2);
		
		vo2 = (BoardVO) service.selectOne("board.selectProductCount", vo2);
		req.setAttribute("product", vo2);
		
		return "/admin/adminMain";
	}
	
}
