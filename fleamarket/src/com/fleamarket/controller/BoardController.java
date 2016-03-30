package com.fleamarket.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.service.Service;
import com.fleamarket.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	Service service;
	
	Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping("/boardform")
	public String boardForm() throws Exception{
		//////
		return "/WEB-INF/addrbook/fleamarket_board.jsp";
	}
	
}
