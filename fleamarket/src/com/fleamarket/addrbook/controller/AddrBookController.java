package com.fleamarket.addrbook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.addrbook.vo.AddrBookVO;
import com.fleamarket.common.service.Service;

@Controller
public class AddrBookController {
	
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/listaddrbook")
	public String listAddrBook(HttpServletRequest req) throws Exception {
		
		logger.debug("listaddrbook.do");
		List<AddrBookVO> list = service.selectList("addrbook.selectAddrBookList", null);
		logger.debug(list.size());
		req.setAttribute("list", list);
		return "/WEB-INF/view/addrbook/addrbook_list.jsp";
	}
	
	@RequestMapping("editView.do")
	public String editView(@ModelAttribute("AddrBookVO") AddrBookVO vo, Model model) throws Exception {
		vo = (AddrBookVO) service.selectOne("addrbook.selectAddrBookById", vo);
		model.addAttribute("vo", vo);
		return "/WEB-INF/view/addrbook/addrbook_edit_form.jsp";
	}
	
	@RequestMapping("updateAddrBook.do")
	public String updateAddrBook(@ModelAttribute("AddrBookVO") AddrBookVO vo) throws Exception {
		
		if(service.update("addrbook.updateAddrBook",vo) != 0){
			logger.debug("업데이트 성공");
			return "redirect:listaddrbook.do";
		}
		return "";
	}
	
	@RequestMapping("insertAddrBook.do")
	public String insertAddrBook() throws Exception {
		return "/WEB-INF/view/addrbook/addrbook_form.jsp";
	}
	
	@RequestMapping("insertAddrBookAction.do")
	public String insertAddrBookAction(@ModelAttribute("AddrBookVO") AddrBookVO vo) throws Exception {
		if(service.insert("addrbook.insertAddrBook",vo) != 0){
			logger.debug("등록 성공");
			return "redirect:listaddrbook.do";
		}
		
		return "";
	}
	
	@RequestMapping("deleteAddrBook.do")
	public String deleteAddrBook(@ModelAttribute("AddrBookVO") AddrBookVO vo) throws Exception {	
		if(service.insert("addrbook.deleteAddrBook",vo.getAbId()) != 0){
			logger.debug("삭제 성공");
			return "redirect:listaddrbook.do";
		}
		return "";
	}
}
