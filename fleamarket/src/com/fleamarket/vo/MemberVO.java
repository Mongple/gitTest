package com.fleamarket.vo;

public class MemberVO extends PageVO{
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String memBirth;
	private String memBirth1;
	private String memBirth2;
	private String memBirth3;
	private String memDate;
	private String memPhone;
	private String memPhone1;
	private String memPhone2;
	private String memPhone3;
	private String memEmail;
	private String memGrant;
	private int memBlack;
	
	private String searchType;
	private String searchData;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int memNo, String memId, String memPwd, String memName, String memBirth, String memBirth1,
			String memBirth2, String memBirth3, String memDate, String memPhone, String memPhone1, String memPhone2,
			String memPhone3, String memEmail, String memGrant, int memBlack, String searchType, String searchData) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memBirth1 = memBirth1;
		this.memBirth2 = memBirth2;
		this.memBirth3 = memBirth3;
		this.memDate = memDate;
		this.memPhone = memPhone;
		this.memPhone1 = memPhone1;
		this.memPhone2 = memPhone2;
		this.memPhone3 = memPhone3;
		this.memEmail = memEmail;
		this.memGrant = memGrant;
		this.memBlack = memBlack;
		this.searchType = searchType;
		this.searchData = searchData;
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

	public String getMemBirth1() {
		return memBirth1;
	}

	public void setMemBirth1(String memBirth1) {
		this.memBirth = memBirth1;
		this.memBirth1 = memBirth1;
	}

	public String getMemBirth2() {
		
		return memBirth2;
	}

	public void setMemBirth2(String memBirth2) {
		this.memBirth = this.memBirth+"/"+memBirth2;
		this.memBirth2 = memBirth2;
	}

	public String getMemBirth3() {
		return memBirth3;
	}

	public void setMemBirth3(String memBirth3) {
		this.memBirth = this.memBirth+"/"+memBirth3;
		this.memBirth3 = memBirth3;
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

	public String getMemPhone1() {
		return memPhone1;
	}

	public void setMemPhone1(String memPhone1) {
		this.memPhone = memPhone1;
		this.memPhone1 = memPhone1;
	}

	public String getMemPhone2() {
		return memPhone2;
	}

	public void setMemPhone2(String memPhone2) {
		this.memPhone = this.memPhone + "-" + memPhone2;
		this.memPhone2 = memPhone2;
	}

	public String getMemPhone3() {
		return memPhone3;
	}

	public void setMemPhone3(String memPhone3) {
		this.memPhone = this.memPhone + "-" + memPhone3;
		this.memPhone3 = memPhone3;
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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
}
	