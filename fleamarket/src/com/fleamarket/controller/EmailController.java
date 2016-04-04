package com.fleamarket.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fleamarket.service.EmailSender;
import com.fleamarket.service.Service;
import com.fleamarket.vo.EmailVO;
import com.fleamarket.vo.MemberVO;

@Controller
public class EmailController {
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	Service service;
	
	int index = 0;
	char[] charSet = new char[] {
		    '0','1','2','3','4','5','6','7','8','9'
		    ,'A','B','C','D','E','F','G','H','I','J','K','L','M'
		    ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
		    ,'a','b','c','d','e','f','g','h','i','j','k','l','m'
		    ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};
	
	@RequestMapping("/member/sendEmailPwd")
	public String sendEmailPwd (@ModelAttribute("EmailVO") EmailVO vo, HttpServletRequest req) throws Exception {
		
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<10; i++) {
			index =  (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		String tempPwd = sb.toString(); //임시비번
		MemberVO memVo = new MemberVO();
		memVo.setMemPwd(tempPwd);
		memVo.setMemEmail(vo.getReceiver());
		memVo.setMemId((String)req.getParameter("memId"));
		if(service.update("member.updatePwd", memVo) != 0){
			String subject = "FleaMarket 임시 비밀번호 입니다.";
		    String content = "====================================\n\n임시 비밀번호는 : ["+tempPwd+"] 입니다.\n\n====================================";
		    vo.setSubject(subject);
		    vo.setContent(content);
		    emailSender.SendEmail(vo);
		    return "redirect:/member/login";
		}
	    
	    return "";
	}
	
	//인증코드관련
	/*@RequestMapping("/member/mypage/sendEmail")
	public String sendEmailAction (@ModelAttribute("EmailVO") EmailVO vo, HttpServletRequest req) throws Exception {
		
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<10; i++) {
			index =  (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		String sessionEmail = sb.toString(); //이메일 인증코드
		req.getSession().setAttribute("sessionEmail", sessionEmail);
	    String subject = "인증코드 입니다.";
	    String content = "회원가입 인증코드는 : ["+sessionEmail+"] 입니다.";
	    vo.setSubject(subject);
	    vo.setContent(content);
	    emailSender.SendEmail(vo);
	    //req.getSession().removeAttribute("email");
	    return "";
	}*/
}
