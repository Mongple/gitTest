package com.fleamarket.vo;


public class BoardVO extends PageVO{
	private int baNo;
	private int memNo;
	private String baType;
	private String baTitle;
	private String baContent;
	private int baCount;
	private String baDate;
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardVO(int baNo, int memNo, String baType, String baTitle, String baContent, int baCount, String baDate) {
		super();
		this.baNo = baNo;
		this.memNo = memNo;
		this.baType = baType;
		this.baTitle = baTitle;
		this.baContent = baContent;
		this.baCount = baCount;
		this.baDate = baDate;
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
	
	
}
