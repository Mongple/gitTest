package com.fleamarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.service.Service;
import com.fleamarket.vo.BoardVO;

@Controller
public class NoticeController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/notice/board")
	public String viewNotice(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		
		vo.setTotalRowCnt((int) service.selectOne("notice.selectCnt",vo));
		List<BoardVO> list = service.selectList("notice.selectList", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		
		return "/notice/board";
	}
	
	@RequestMapping("/notice/resultboard")
	public String viewMyPageResultBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		vo.setTotalRowCnt((int) service.selectOne("notice.selectCnt",vo));
		List<BoardVO> list = service.selectList("notice.selectList", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		return "/member/resultboard";
	}
	
	@RequestMapping("/notice/write")
	public String goNoticeWrite(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		
		
		return "/notice/write";
	}
	
}
