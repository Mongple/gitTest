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

import com.fleamarket.service.Service;
import com.fleamarket.vo.BoardVO;
import com.fleamarket.vo.MemberVO;

@Controller
public class AdminController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	//testBranch에 commit!
	@RequestMapping("/admin/adminMain/rate")
	public String viewAdminRate(HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null || req.getSession().getAttribute("sessionGrant").equals("U")) {
			return "redirect:/mustLogin";
		}
		MemberVO vo = new MemberVO();
		BoardVO vo2 = new BoardVO();
		
		vo = (MemberVO) service.selectOne("admin.selectUserCount", vo);
		req.setAttribute("user", vo);
		
		vo = (MemberVO) service.selectOne("admin.selectAdminCount", vo);
		req.setAttribute("admin", vo);
		
		vo2 = (BoardVO) service.selectOne("admin.selectNoticeCount", vo2);
		req.setAttribute("notice", vo2);
		
		vo2 = (BoardVO) service.selectOne("admin.selectWearCount", vo2);
		req.setAttribute("wear", vo2);
		
		vo2 = (BoardVO) service.selectOne("admin.selectProductCount", vo2);
		req.setAttribute("product", vo2);
		
		return "/admin/adminMain";
	}
	
	@RequestMapping("/admin/userManage/manageList")
	public String viewUserList(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null || req.getSession().getAttribute("sessionGrant").equals("U")) {
			return "redirect:/mustLogin";
		}
		
		vo.setTotalRowCnt((int) service.selectOne("admin.selectUserListCnt", vo));
		List<MemberVO> list = service.selectList("admin.selectUserList", vo, new RowBounds(vo.getOffset(), vo.getLimit()));
		
		MemberVO total = new MemberVO();
		total = (MemberVO) service.selectOne("admin.selectMemberCount", total);
		
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		req.setAttribute("total", total);
		
		if(req.getRequestURI().contains(".ajax")){
			return "/admin/resultUserManage";
		}
		return "/admin/userManage";
	}
	
	@RequestMapping("/admin/userManage/add")
	public String addBlack(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null || req.getSession().getAttribute("sessionGrant").equals("U")) {
			return "redirect:/mustLogin";
		}
		service.update("admin.addBlack", vo);
		return "redirect:/admin/userManage/manageList";
	}
	
	@RequestMapping("/admin/userManage/update")
	public String adminUpdate(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		if(req.getSession().getAttribute("sessionId") == null || req.getSession().getAttribute("sessionGrant").equals("U")) {
			return "redirect:/mustLogin";
		}
		service.update("admin.updateMember", vo);
		return "redirect:/admin/userManage/manageList";
	}
	
	@RequestMapping("/admin/userManage/delete")
	public String adminDelete(@ModelAttribute("MemberVO") MemberVO vo, HttpServletRequest req) throws Exception {
		vo = (MemberVO) service.selectOne("member.selectMemberInfo", vo);
		if(service.insert("member.insertB_Member", vo) != 0) {
			service.update("member.deleteMember", vo);
		}
		return "redirect:/admin/userManage/manageList";
	}
	
	
}
