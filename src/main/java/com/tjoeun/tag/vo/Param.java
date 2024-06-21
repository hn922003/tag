package com.tjoeun.tag.vo;

public class Param {

	private int cnum;
	private String memo;
	
	public Param() { }

	public Param(int cnum, String memo) {
		super();
		this.cnum = cnum;
		this.memo = memo;
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

	@Override
	public String toString() {
		return "Param [cnum=" + cnum + ", memo=" + memo + "]";
	}
	
}
