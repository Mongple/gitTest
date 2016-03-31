package com.fleamarket.vo;


public class BoardVO extends PageVO{
	private int baNo;
	private int memNo;
	private String baType;
	private String baTitle;
	private String baContent;
	private int baCount;
	private String baDate;
	
	private String memId;
	private String memName;
	
	private int rpNo;
	private String rpContent;
	private String rpDate;
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	public BoardVO(int baNo, int memNo, String baType, String baTitle, String baContent, int baCount, String baDate,
			String memId, String memName, int rpNo, String rpContent, String rpDate) {
		super();
		this.baNo = baNo;
		this.memNo = memNo;
		this.baType = baType;
		this.baTitle = baTitle;
		this.baContent = baContent;
		this.baCount = baCount;
		this.baDate = baDate;
		this.memId = memId;
		this.memName = memName;
		this.rpNo = rpNo;
		this.rpContent = rpContent;
		this.rpDate = rpDate;
	}
	public int getBaNo() {
		return baNo;
	}
	public void setBaNo(int baNo) {
		this.baNo = baNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getBaType() {
		return baType;
	}
	public void setBaType(String baType) {
		this.baType = baType;
	}
	public String getBaTitle() {
		return baTitle;
	}
	public void setBaTitle(String baTitle) {
		this.baTitle = baTitle;
	}
	public String getBaContent() {
		return baContent;
	}
	public void setBaContent(String baContent) {
		this.baContent = baContent;
	}
	public int getBaCount() {
		return baCount;
	}
	public void setBaCount(int baCount) {
		this.baCount = baCount;
	}
	public String getBaDate() {
		return baDate;
	}
	public void setBaDate(String baDate) {
		this.baDate = baDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getRpNo() {
		return rpNo;
	}
	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}
	public String getRpContent() {
		return rpContent;
	}
	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}
	public String getRpDate() {
		return rpDate;
	}
	public void setRpDate(String rpDate) {
		this.rpDate = rpDate;
	}
	
	
}
