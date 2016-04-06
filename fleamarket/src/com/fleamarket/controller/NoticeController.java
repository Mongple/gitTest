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
	
	@RequestMapping("/notice/noticeList")
	public String viewNotice(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		
		vo.setTotalRowCnt((int) service.selectOne("notice.selectCnt",vo));
		List<BoardVO> list = service.selectList("notice.selectList", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		
		if(req.getRequestURI().contains(".ajax")){
			return "/notice/resultboard";
		}
		
		return "/notice/noticeBoard";
	}
	
	@RequestMapping("/notice/noticeList/write")
	public String goNoticeWrite(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		return "/notice/write";
	}
	
	
	@RequestMapping("/notice/editboard")
	public String editBoard(@ModelAttribute("BoardVO") BoardVO vo, Model model) throws Exception{
		vo = (BoardVO) service.selectOne("notice.selectBoardByNo", vo);
		model.addAttribute("vo", vo);
		return "/notice/edit";
	}
	
	@RequestMapping("/notice/updateBaCount")
	public String updateBaCount(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		if(service.update("notice.updateBaCount",vo) != 0){
			return "redirect:/notice/board?baNo="+vo.getBaNo();
		}
		return "";
	}
	
	@RequestMapping("/notice/deleteBoard")
	public String deleteBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {	
		req.setAttribute("vo", vo);
		if(service.delete("notice.deleteBoard",vo.getBaNo()) != 0){
			return "redirect:/notice/noticeList";
		}
		return "";
	}
	
	@RequestMapping("/notice/board")
	public String boardForm(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception{
		vo = (BoardVO) service.selectOne("notice.selectBoardByNo", vo);
		List<BoardVO> rplist = service.selectList("notice.selectReplyByBaNo", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("rplist",rplist);
		req.setAttribute("vo", vo);
		return "/notice/read";
	}
	
	@RequestMapping("/notice/insertComment")
	public String insertComment(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		vo.setMemId((String) req.getSession().getAttribute("sessionId"));
		req.setAttribute("vo", vo);
		if(service.insert("notice.insertComment",vo) != 0){
			return "redirect:/notice/board?baNo="+vo.getBaNo();
		}
		return "";
	}
	
	@RequestMapping("/notice/deleteComment")
	public String deleteComment(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {	
		if(service.delete("notice.deleteComment",vo) != 0){
			return "redirect:/notice/board?baNo="+vo.getBaNo();
		}
		req.setAttribute("vo", vo);
		return "";
	}
	
	
}
