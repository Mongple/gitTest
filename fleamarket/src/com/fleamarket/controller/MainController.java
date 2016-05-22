package com.fleamarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.service.MainPageUtil;
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
	//스테이지영역 생략하고 커밋 푸쉬가 됨?
	@RequestMapping("/main")
	public String goMain2(HttpServletRequest req) throws Exception {
		BoardVO wear = new BoardVO();
		BoardVO pro = new BoardVO();
		wear.setBaType("WEAR");
		pro.setBaType("PRODUCT");
		
		List<BoardVO> wearList = service.selectList("board.selectRecentlyBoard", wear, new RowBounds(0,3));
		List<BoardVO> proList = service.selectList("board.selectRecentlyBoard", pro, new RowBounds(0,3));
		
		MainPageUtil util = new MainPageUtil();
		wearList = util.getPicture(wearList);
		proList = util.getPicture(proList);
		req.setAttribute("wearList", wearList);
		req.setAttribute("proList", proList);
		return "/main/main";
	}
	
	@RequestMapping("/info")
	public String goInfo() throws Exception {
		
		return "/main/info";
	}
	
	@RequestMapping("/market")
	public String goFleaMarket(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		if(vo.getBaType() == null)
			vo.setBaType("WEAR");
		vo.setTotalRowCnt((int)service.selectOne("board.selectBoardCnt", vo));
		List<BoardVO> list = service.selectList("board.selectBoardByType",vo,new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("list",list);
		req.setAttribute("vo", vo);
		if(req.getRequestURI().contains(".ajax"))
			return "/fleamarket/fleamarketlistResult";
		return "/fleamarket/fleamarketlist";
	}
	
	@RequestMapping("/notice")
	public String goNotice() throws Exception {
		
		return "redirect:/notice/noticeList";
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
			return "redirect:/mustLogin";
		}
		return "redirect:/member/mypage/board";
	}
	
	@RequestMapping("/admin/adminMain")
	public String goAdminMain(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null || req.getSession().getAttribute("sessionGrant").equals("U")) {
			return "redirect:/mustLogin";
		}
		return "redirect:/admin/adminMain/rate";
	}
}
