package com.tjoeun.tag.vo;

import java.util.Date;

public class MycommentVO
{
    private int usernum; // 유저 번호
    private int lcnum; // 댓글 좋아요 수
    private int tnum; // 댓글 본문 번호
    private  String writer;
    private String title;
    private String nickname; // 댓글 닉네임
    private String memo; // 댓글
    private Date cdate; // 댓글 작성일

    public MycommentVO(int usernum, int lcnum, int tnum, String writer, String title, String nickname, String memo, Date cdate) {
        this.usernum = usernum;
        this.lcnum = lcnum;
        this.tnum = tnum;
        this.writer = writer;
        this.title = title;
        this.nickname = nickname;
        this.memo = memo;
        this.cdate = cdate;
    }

    public MycommentVO() {}

    public int getUsernum() {
        return usernum;
    }

    public void setUsernum(int usernum) {
        this.usernum = usernum;
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

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
        return "MycommentVO{" +
                "usernum=" + usernum +
                ", lcnum=" + lcnum +
                ", tnum=" + tnum +
                ", writer='" + writer + '\'' +
                ", title='" + title + '\'' +
                ", nickname='" + nickname + '\'' +
                ", memo='" + memo + '\'' +
                ", cdate=" + cdate +
                '}';
    }
}
