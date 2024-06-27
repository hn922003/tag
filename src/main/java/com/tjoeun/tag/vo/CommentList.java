package com.tjoeun.tag.vo;

import java.util.ArrayList;

public class CommentList {

	private ArrayList<CommentVO> list = new ArrayList<CommentVO>();
	private int pageSize = 5; 
	private int totalComment = 0;
	private int currentPage = 1;
	private int totalPage = 0; 
	private int startNo = 0;
	private int endNo = 0; 
	private int startPage = 0;
	private int endPage = 0;
	
	public CommentList() { }
	
	public CommentList(int pageSize, int totalComment, int currentPage) {
		this.pageSize = pageSize;
		this.totalComment = totalComment;
		this.currentPage = currentPage;
		calculator();
	}
	
	// 1차 병합 후 변경(28, 33, 34번 줄)
	private void calculator() {
		totalPage = (totalComment - 1) / 5 + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalComment ? totalComment : endNo;
		startPage = (currentPage - 1) / 5 * 5 + 1;
		endPage = startPage + 4;
		endPage = endPage > totalPage ? totalPage : endPage;
	}

	public ArrayList<CommentVO> getList() {
		return list;
	}

	public void setList(ArrayList<CommentVO> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalComment() {
		return totalComment;
	}

	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
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
		return "CommentList [list=" + list + ", pageSize=" + pageSize + ", totalComment=" + totalComment
				+ ", currentPage=" + currentPage + ", totalPage=" + totalPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}
