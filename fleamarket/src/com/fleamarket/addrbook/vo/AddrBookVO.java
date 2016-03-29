package com.fleamarket.addrbook.vo;

import com.fleamarket.common.page.PageVO;

public class AddrBookVO extends PageVO {

	private int abId;
	private String abName;
	private String abTel;
	private String abBirth;
	private String abComdept;
	private String abMemo;
	private String abEmail;
	
	public AddrBookVO() {
		// TODO Auto-generated constructor stub
	}

	public AddrBookVO(int abId, String abName, String abTel, String abBirth, String abComdept, String abMemo,
			String abEmail) {
		super();
		this.abId = abId;
		this.abName = abName;
		this.abTel = abTel;
		this.abBirth = abBirth;
		this.abComdept = abComdept;
		this.abMemo = abMemo;
		this.abEmail = abEmail;
	}
	
	
	public int getAbId() {
		return abId;
	}

	public void setAbId(int abId) {
		this.abId = abId;
	}

	public String getAbName() {
		return abName;
	}

	public void setAbName(String abName) {
		this.abName = abName;
	}

	public String getAbTel() {
		return abTel;
	}

	public void setAbTel(String abTel) {
		this.abTel = abTel;
	}

	public String getAbBirth() {
		return abBirth;
	}

	public void setAbBirth(String abBirth) {
		this.abBirth = abBirth;
	}

	public String getAbComdept() {
		return abComdept;
	}

	public void setAbComdept(String abComdept) {
		this.abComdept = abComdept;
	}

	public String getAbMemo() {
		return abMemo;
	}

	public void setAbMemo(String abMemo) {
		this.abMemo = abMemo;
	}

	public String getAbEmail() {
		return abEmail;
	}

	public void setAbEmail(String abEmail) {
		this.abEmail = abEmail;
	}

	@Override
	public String toString() {
		return "AddrBook [abId=" + abId + ", abName=" + abName + ", abTel=" + abTel + ", abBirth=" + abBirth
				+ ", abComdept=" + abComdept + ", abMemo=" + abMemo + ", abEmail=" + abEmail + "]";
	}	
}
