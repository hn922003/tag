package com.tjoeun.tag.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.tag.vo.CommentVO;
import com.tjoeun.tag.vo.Param;
import com.tjoeun.tag.vo.TrendVO;
import com.tjoeun.tag.vo.UserVO;

public interface MybatisDAO {

	int selectCount();

	ArrayList<TrendVO> selectList(HashMap<String, Integer> hmap);

	int selectCommentCount(int tnum);
	
	//================================= + 수미 ==============================
	TrendVO selectByTnum(int tnum);

	int selectCountComment(int tnum);

	ArrayList<CommentVO> selectCommentList(HashMap<String, Integer> hmap);

	ArrayList<TrendVO> selectWriterTitle(HashMap<String, String> hmap2);

	void insertComment(CommentVO co);

	void deleteComment(int cnum);

	void report(HashMap<String, Integer> hmap);

	// void scrap(Param param);
	void insertScrap(int tnum);

	void insertTrendLike(HashMap<String, Integer> hmap);

	void insertCoLike(HashMap<String, Integer> hmap);

	ArrayList<CommentVO> selectCommentListCnum(int cnum);

	void updateComment(Param param);

	
	//======================================== +건희 ===========================================
	int contentCount();
	ArrayList<TrendVO> contentList();
	ArrayList<TrendVO> contentSearch(String searchval);
	
	//======================================== +형빈 ===========================================
	/* 로그인 and 회원가입 */
    void SignUp(HashMap<String, String> vo);

    int NickCheck(String nickname);

	int IdCheck(String userid);

	int PwCheck(HashMap<String, String> vo);

	UserVO SignIn(HashMap<String, String> vo);

	UserVO Myinfo(String nickname);
}
