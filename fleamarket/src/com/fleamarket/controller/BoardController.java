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
public class BoardController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/market/writeboard")/*/fleamarket_board_write*/
	public String insertBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception{
		if((String)req.getSession().getAttribute("sessionId") == null )
			return "redirect:/main";
		req.setAttribute("vo", vo);
		return "/fleamarket/fleamarket_board_write";
	}
	@RequestMapping("/market/writeboard/action")/*/fleamarket_board_write_action*/
	public String insertBoardAction(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		System.out.println("//////"+vo.getBaTitle());
		System.out.println("//////"+vo.getBaContent());
		/*vo.setMemId((String) req.getSession().getAttribute("sessionId"));
		req.setAttribute("vo", vo);
		if(service.insert("board.insertBoard",vo) != 0){
			logger.debug("등록성공");

			System.out.println("확인"+vo.getBaType());
			if(vo.getBaType().equals("WEAR")){
				return "redirect:/market";
			}
			else{
				return "redirect:/market/prod";
			}
		}*/
		return "";
	}
	@RequestMapping("/market/editboard")/*fleamarket_board_edit*/
	public String editBoard(@ModelAttribute("BoardVO") BoardVO vo, Model model) throws Exception{
		vo = (BoardVO) service.selectOne("board.selectBoardByNo", vo);
		model.addAttribute("vo", vo);
		return "/fleamarket/fleamarket_board_edit";
	}
	@RequestMapping("/market/updateBoard")
	public String updateBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		if(service.update("board.updateBoard",vo) != 0){
			logger.debug("업데이트 성공");
			return "redirect:/market/board?baNo="+vo.getBaNo();
		}
		return "";
	}
	@RequestMapping("/market/updateBaCount")
	public String updateBaCount(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		if(service.update("board.updateBaCount",vo) != 0){
			logger.debug("조회수업데이트 성공");
			return "redirect:/market/board?baNo="+vo.getBaNo();
		}
		return "";
	}
	@RequestMapping("/market/deleteBoard")
	public String deleteBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {	
		req.setAttribute("vo", vo);
		if(service.delete("board.deleteBoard",vo.getBaNo()) != 0){
			logger.debug("삭제 성공");
			return "redirect:/market";
		}
		return "";
	}
	
	/* 댓글 */
	@RequestMapping("/market/board")/*fleamarket_board*/
	public String boardForm(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception{
		vo = (BoardVO) service.selectOne("board.selectBoardByNo", vo);
		List<BoardVO> rplist = service.selectList("board.selectReplyByBaNo", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("rplist",rplist);
		req.setAttribute("vo", vo);
		return "/fleamarket/fleamarket_board";
	}
	@RequestMapping("/market/insertComment")
	public String insertComment(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		vo.setMemId((String) req.getSession().getAttribute("sessionId"));
		req.setAttribute("vo", vo);
		if(service.insert("board.insertComment",vo) != 0){
			logger.debug("등록성공");
			return "redirect:/market/board?baNo="+vo.getBaNo();
		}
		return "";
	}
	@RequestMapping("/market/deleteComment")
	public String deleteComment(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {	
		if(service.delete("board.deleteComment",vo) != 0){
			logger.debug("댓글삭제 성공");
			return "redirect:/market/board?baNo="+vo.getBaNo();
		}
		req.setAttribute("vo", vo);
		return "";
	}
	
}
