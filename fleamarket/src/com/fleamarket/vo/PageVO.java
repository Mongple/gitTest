package com.fleamarket.vo;

public class PageVO {
	private int page;		//현재 페이지
	private int block;		//현재 블록
	private int pageCnt;	//모든 페이지 수
	private int blockSize;	//총 블록 사이즈
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public PageVO(int page, int block, int pageCnt, int blockSize) {
		super();
		this.page = page;
		this.block = block;
		this.pageCnt = pageCnt;
		this.blockSize = blockSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBlock() {
		return block;
	}

	public void setBlock(int block) {
		this.block = block;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
}
