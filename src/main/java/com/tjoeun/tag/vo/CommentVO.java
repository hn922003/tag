package com.tjoeun.tag.vo;

import java.util.Date;

public class CommentVO {

	private int usernum; // 유저 번호
	private int cnum; // 댓글 고유번호
	private int lcnum; // 댓글 좋아요 수
	private int tnum; // 댓글 본문 번호
	private int rnum; // 신고 수
	private String nickname; // 댓글 닉네임
	private String memo; // 댓글
	private Date cdate; // 댓글 작성일
	
	public CommentVO() { }

	public CommentVO(int usernum, int cnum, int lcnum, int tnum, int rnum, String nickname, String memo, Date cdate) {
		super();
		this.usernum = usernum;
		this.cnum = cnum;
		this.lcnum = lcnum;
		this.tnum = tnum;
		this.rnum = rnum;
		this.nickname = nickname;
		this.memo = memo;
		this.cdate = cdate;
	}

	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getLcnum() {
		return lcnum;
	}
	public void setLcnum(int lcnum) {
		this.lcnum = lcnum;
	}
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	@Override
	public String toString() {
		return "CommentVO [usernum=" + usernum + ", cnum=" + cnum + ", lcnum=" + lcnum + ", tnum=" + tnum + ", rnum="
				+ rnum + ", nickname=" + nickname + ", memo=" + memo + ", cdate=" + cdate + "]";
	}
	
}
