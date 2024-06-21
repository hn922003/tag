package com.tjoeun.tag.vo;

import java.util.ArrayList;

public class TrendList {
	private ArrayList<TrendVO> list = new ArrayList<TrendVO>();
	private int pageSize = 6; // 한줄(페이지)에 3개씩 보여줌
	private int totalCount = 0; // 전체 트렌드 수
	private int currentPage = 1; // 현재 페이지
	private int totalPage = 0; // 총 페이지 수
	private int startNo = 0; // 현재 페이지 트렌드의 시작번호
	private int endNo = 0; // 현재 페이지 트렌드의 끝번호
	private int startPage = 0; // 현재 페이지 시작번호
	private int endPage = 0; // 현재 페이지 끝번호

	public TrendList() {	}
	
	public TrendList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}

	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / pageSize * pageSize + 1; 
		endPage = startPage + pageSize - 1;
		endPage = endPage > totalPage ? totalPage : endPage;
	}

	public ArrayList<TrendVO> getList() {
		return list;
	}

	public void setList(ArrayList<TrendVO> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "TrendList [list=" + list + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", currentPage="
				+ currentPage + ", totalPage=" + totalPage + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
