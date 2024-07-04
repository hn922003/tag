package com.tjoeun.tag.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.tag.vo.CommentVO;
import com.tjoeun.tag.vo.MycommentVO;
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

	// 신고
	int reportfirst(HashMap<String, Integer> hmap);
	void insertTrendReport(HashMap<String, Integer> hmap);
	void reportInsert(HashMap<String, Integer> hmap);
	int report(HashMap<String, Integer> hmap);
	void reportUpdate(HashMap<String, Integer> hmap);

	// 스크랩
	int scrapfirst(HashMap<String, Integer> hmap);
	void scrapInsert(Param param);
	int scrap(HashMap<String, Integer> hmap);
	void scrapUpdate(HashMap<String, Integer> hmap);
	void scrapDelete(HashMap<String, Integer> hmap);

	// 좋아요
	int tlikefirst(HashMap<String, Integer> hmap);
	void insertTrendLike(HashMap<String, Integer> hmap);
	void tilkeInsert(HashMap<String, Integer> hmap);
	int tlike(HashMap<String, Integer> hmap);
	void tlikeUpdate(HashMap<String, Integer> hmap);
	void deleteTrendLike(HashMap<String, Integer> hmap);
	void tlikeDelete(HashMap<String, Integer> hmap);
	
	// 댓글 좋아요
	int clikefirst(HashMap<String, Integer> hmap);
	void insertCoLike(HashMap<String, Integer> hmap);
	void clikeInsert(HashMap<String, Integer> hmap);
	int clike(HashMap<String, Integer> hmap);
	void clikeUpdate(HashMap<String, Integer> hmap);
	void deleteCoLike(HashMap<String, Integer> hmap);
	void clikeDelete(HashMap<String, Integer> hmap);

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

	ArrayList<MycommentVO> MyComment(String nickname);

	ArrayList<CommentVO> MyScrap(int usernum);

	int commentCnt(String nickname);

	int scrapCnt(int usernum);






}
