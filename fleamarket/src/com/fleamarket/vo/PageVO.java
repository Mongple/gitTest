package com.fleamarket.vo;

public class PageVO {
	private int page = 1;		//현재 페이지
	private int block = 1;		//현재 블록
	private int pageCnt;	//모든 페이지 수
	private int blockCnt = 1;	//총 블록 수
	private int blockSize = 10;	//블록당 페이지 수
	private int offset = 0;
	private int limit = 10;
	private int pageSize = 10;
	private int totalRowCnt;
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	
	public PageVO(int page, int block, int pageCnt, int blockCnt, int blockSize, int offset, int limit, int pageSize,
			int totalRowCnt) {
		super();
		this.page = page;
		this.block = block;
		this.pageCnt = pageCnt;
		this.blockCnt = blockCnt;
		this.blockSize = blockSize;
		this.offset = offset;
		this.limit = limit;
		this.pageSize = pageSize;
		this.totalRowCnt = totalRowCnt;
	}

	public int getTotalRowCnt() {
		return totalRowCnt;
	}

	public void setTotalRowCnt(int totalRowCnt) {
		this.pageCnt = (totalRowCnt % pageSize) == 0 ? (totalRowCnt / pageSize) : (totalRowCnt / pageSize)+1;
		this.totalRowCnt = totalRowCnt;
		this.blockCnt = (pageCnt % blockSize) == 0 ? (pageCnt / blockSize) : (pageCnt / blockSize)+1;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.offset = (pageSize*page) - pageSize;
		this.limit = pageSize;
		this.block = (page % blockSize) == 0 ? (page / blockSize) : (page / blockSize)+1;
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

	public int getBlockCnt() {
		return blockCnt;
	}

	public void setBlockCnt(int blockCnt) {
		this.blockCnt = blockCnt;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}



	public int getPageSize() {
		return pageSize;
	}



	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
