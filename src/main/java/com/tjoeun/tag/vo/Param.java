package com.tjoeun.tag.vo;

public class Param {

	private int cnum;
	private String memo;
	private int tnum;
	private int lnum;
	private int usernum;
	private String title;
	private String writer;

	public Param() { }

	public Param(int cnum, String memo) {
		super();
		this.cnum = cnum;
		this.memo = memo;
	}

	public Param(int tnum, int lnum, int usernum, String title, String writer) {
		super();
		this.tnum = tnum;
		this.lnum = lnum;
		this.usernum = usernum;
		this.title = title;
		this.writer = writer;
	}

	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}
	public int getLnum() {
		return lnum;
	}
	public void setLnum(int lnum) {
		this.lnum = lnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Param [cnum=" + cnum + ", memo=" + memo + ", tnum=" + tnum + ", lnum=" + lnum + ", usernum=" + usernum
				+ ", title=" + title + ", writer=" + writer + "]";
	}

}
