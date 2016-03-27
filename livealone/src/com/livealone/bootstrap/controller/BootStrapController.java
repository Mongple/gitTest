package com.livealone.bootstrap.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BootStrapController {

	Logger logger = LogManager.getLogger(this.getClass());

	@RequestMapping("bootStrapTest.do")
	public String listAddrBook() throws Exception {

		return "/WEB-INF/view/bootstrap/bootstrapTest.jsp";
	}
}
