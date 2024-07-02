package com.tjoeun.tag.vo;

import java.util.Date;

public class UserVO
{
	private String nickname; // 닉네임
	private int usernum; // 유저번호
	private String userid; // 아이디
	private String pw; // 패스워드
	private String email; // 이메일
	private Date birth; // 생일
	private Date jdate; // 가입일자
	private String bookmark; // 즐겨찾기
	private int point; // 포인트
	private int tnum; // 트렌드 번호
	private int tlike; // 트렌드 좋아요 눌렀는지 확인할 변수
	private int clike; // 댓글 좋아요 눌렀는지 확인할 변수
	private int report; // 신고 눌렀는지 확인할 변수

	public UserVO() {}
	
	public UserVO(String nickname, int usernum, String userid, String pw, String email, Date birth, Date jdate,
			String bookmark, int point, int tnum, int tlike, int clike, int report) {
		super();
		this.nickname = nickname;
		this.usernum = usernum;
		this.userid = userid;
		this.pw = pw;
		this.email = email;
		this.birth = birth;
		this.jdate = jdate;
		this.bookmark = bookmark;
		this.point = point;
		this.tnum = tnum;
		this.tlike = tlike;
		this.clike = clike;
		this.report = report;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getUsernum() {
		return usernum;
	}

	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Date getJdate() {
		return jdate;
	}

	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}

	public String getBookmark() {
		return bookmark;
	}

	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTnum() {
		return tnum;
	}

	public void setTnum(int tnum) {
		this.tnum = tnum;
	}

	public int getTlike() {
		return tlike;
	}

	public void setTlike(int tlike) {
		this.tlike = tlike;
	}

	public int getClike() {
		return clike;
	}

	public void setClike(int clike) {
		this.clike = clike;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return "UserVO [nickname=" + nickname + ", usernum=" + usernum + ", userid=" + userid + ", pw=" + pw
				+ ", email=" + email + ", birth=" + birth + ", jdate=" + jdate + ", bookmark=" + bookmark + ", point="
				+ point + ", tnum=" + tnum + ", tlike=" + tlike + ", clike=" + clike + ", report=" + report + "]";
	}

}
