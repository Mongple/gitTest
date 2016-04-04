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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fleamarket.service.Service;
import com.fleamarket.vo.BoardVO;
import com.fleamarket.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/member/loginSign")
	@ResponseBody
	public String loginSign(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {

		MemberVO vo2 = (MemberVO) service.selectOne("member.selectMemberChk", vo);
		if(vo2 == null) {
			return "FAIL";
		}else {
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
	
	@RequestMapping("/member/mypage/board")
	public String viewMyPageBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		if(vo.getBaType() == null)
			vo.setBaType("PRODUCT");
		vo.setMemId((String) req.getSession().getAttribute("sessionId"));
		vo.setTotalRowCnt((int) service.selectOne("member.selectMyBoardCnt",vo));
		List<BoardVO> list = service.selectList("member.selectMyBoardList", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		return "/member/board";
	}
	
	@RequestMapping("/member/mypage/resultboard")
	public String viewMyPageResultBoard(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		if(vo.getBaType() == null)
			vo.setBaType("PRODUCT");
		vo.setMemId((String) req.getSession().getAttribute("sessionId"));
		vo.setTotalRowCnt((int) service.selectOne("member.selectMyBoardCnt",vo));
		List<BoardVO> list = service.selectList("member.selectMyBoardList", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		return "/member/resultboard";
	}
	
	@RequestMapping("/member/mypage/chkPwd")
	public String chkPwd(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		return "/member/chk_password";
	}
	
	@RequestMapping("/member/mypage/chkPwdAction")
	@ResponseBody
	public String chkPwdAction(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		vo.setMemId((String)req.getSession().getAttribute("sessionId"));
		MemberVO vo2 = (MemberVO) service.selectOne("member.selectMemberChk", vo);
		if(vo2 == null)
			return "FAIL";
		else {
			return "SUCCESS";
		}
		//return "/member/memberinfo";
	}
	
	@RequestMapping("/member/mypage/memberinfo")
	public String viewMemberInfo(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		vo.setMemId((String)req.getSession().getAttribute("sessionId"));
		MemberVO vo2 = (MemberVO) service.selectOne("member.selectMemberInfo", vo);
		req.setAttribute("vo", vo2);
		return "/member/memberinfo";
	}
	
	@RequestMapping("/member/mypage/update")
	public String update(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		MemberVO vo = new MemberVO();
		vo.setMemId((String)req.getSession().getAttribute("sessionId"));
		MemberVO vo2 = (MemberVO) service.selectOne("member.selectMemberInfo", vo);
		req.setAttribute("vo", vo2);
		return "/member/edit";
	}
	
	@RequestMapping("/member/mypage/updateAction")
	public String updateAction(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null) {
			return "redirect:/main";
		}
		if(service.update("member.updateMember", vo) != 0)
			return "redirect:/member/mypage/memberinfo";
		return "";
		
	}
	
	@RequestMapping("/member/mypage/delete")
	public String delete(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		vo = (MemberVO) service.selectOne("member.selectMemberInfo", vo);
		if(service.insert("member.insertB_Member", vo) != 0) {
			if(service.update("member.deleteMember", vo) != 0) {
				req.getSession().invalidate();
			}
		}
				
		return "redirect:/main";
	}
}
