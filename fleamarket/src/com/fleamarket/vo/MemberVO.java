package com.fleamarket.vo;

public class MemberVO extends PageVO{
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String memBirth;
	private String memDate;
	private String memPhone;
	private String memEmail;
	private String memGrant;
	private int memBlack;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int memNo, String memId, String memPwd, String memName, String memBirth, String memDate,
			String memPhone, String memEmail, String memGrant, int memBlack) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memDate = memDate;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.memGrant = memGrant;
		this.memBlack = memBlack;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemDate() {
		return memDate;
	}

	public void setMemDate(String memDate) {
		this.memDate = memDate;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemGrant() {
		return memGrant;
	}

	public void setMemGrant(String memGrant) {
		this.memGrant = memGrant;
	}

	public int getMemBlack() {
		return memBlack;
	}

	public void setMemBlack(int memBlack) {
		this.memBlack = memBlack;
	}
}
