package com.fleamarket.controller;


import javax.servlet.http.HttpServletRequest;

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
public class BoardController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());

	@RequestMapping("/fleamarket_board")
	public String boardForm(@ModelAttribute("BoardVO") BoardVO vo, Model model) throws Exception{
		vo = (BoardVO) service.selectOne("board.selectBoardByNo", vo);
		model.addAttribute("vo", vo);
		return "/fleamarket/fleamarket_board";
	}

	@RequestMapping("/fleamarket_board_write")
	public String insertBoard() throws Exception{
		//////
		return "/fleamarket/fleamarket_board_write";
	}

	@RequestMapping("/fleamarket_board_edit_action")
	public String insertBoardAction(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		vo.setMemId((String) req.getSession().getAttribute("sessionId"));
		if(service.insert("board.insertBoard",vo) != 0){
			logger.debug("등록성공");
			return "redirect:/fleamarketlist";
		}
		return "";
	}
		
	@RequestMapping("/fleamarket_board_edit")
	public String editBoard(@ModelAttribute("BoardVO") BoardVO vo, Model model) throws Exception{
		vo = (BoardVO) service.selectOne("board.selectBoardByNo", vo);
		model.addAttribute("vo", vo);
		return "/fleamarket/fleamarket_board_edit";
	}
	@RequestMapping("/updateBoard")
	public String updateBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		
		if(service.update("board.updateBoard",vo) != 0){
			logger.debug("업데이트 성공");
			return "redirect:/fleamarket_board?baNo="+vo.getBaNo();
		}
		return "";
	}
	
	@RequestMapping("deleteBoard")
	public String deleteAddrBook(@ModelAttribute("BoardVO") BoardVO vo) throws Exception {	
		if(service.delete("board.deleteBoard",vo.getBaNo()) != 0){
			logger.debug("삭제 성공");
			return "redirect:/fleamarket";
		}
		return "";
	}
	
}
