package com.tjoeun.tag.vo;

import java.util.Date;

public class ScrapVO {

	private int snum;
	private int tnum;
	private int usernum;
	private Date sdate;
	private TrendVO trendVO;
	private CommentVO commentVO;
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public TrendVO getTrendVO() {
		return trendVO;
	}
	public void setTrendVO(TrendVO trendVO) {
		this.trendVO = trendVO;
	}
	public CommentVO getCommentVO() {
		return commentVO;
	}
	public void setCommentVO(CommentVO commentVO) {
		this.commentVO = commentVO;
	}
	
	@Override
	public String toString() {
		return "ScrapVO [snum=" + snum + ", tnum=" + tnum + ", usernum=" + usernum + ", sdate=" + sdate + ", trendVO="
				+ trendVO + ", commentVO=" + commentVO + "]";
	}
	
}
