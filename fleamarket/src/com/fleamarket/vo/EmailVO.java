package com.fleamarket.vo;

public class EmailVO {
	private String subject;
	private String content;
	private String regdate;
	private String receiver;
	
	public EmailVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public EmailVO(String subject, String content, String regdate, String receiver) {
		super();
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.receiver = receiver;
	}



	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
        return regdate;
    }
    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

}
