package com.tjoeun.tag;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjoeun.tag.dao.MybatisDAO;
import com.tjoeun.tag.vo.CommentList;
import com.tjoeun.tag.vo.CommentVO;
import com.tjoeun.tag.vo.Param;
import com.tjoeun.tag.vo.TrendList;
import com.tjoeun.tag.vo.TrendVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	// ==================================================== 건희 ===============================================
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("Home page");
		return "redirect:index";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		logger.info("index page");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		/* 리스트 저장해서 넘겨주는 동작
		//AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		TrendList trendList = ctx.getBean("TrendList", TrendList.class);
		trendList.setList(mapper.contentList());
		
		model.addAttribute("TrendList", trendList);
		ctx.close();
		*/ 
		// 인덱스에 랜덤으로 20개의 리스트를 불러온다.
		int totalCount = mapper.selectCount();
		TrendList trendList = new TrendList(20, totalCount, 1); // 페이지사이즈를 20으로
		trendList.setList(mapper.contentList());
		System.out.println("===============>" + trendList.getList().size());
		
		// 리스트의 트렌드 글 하나(VO)마다 댓글 수를 얻어와 저장한다
		/*
		for (int i = 0; i < trendList.getList().size(); i++) {
			int ccount = mapper.selectCommentCount(trendList.getList().get(i).getTnum());
			trendList.getList().get(i).setCcount(ccount);
		}
		*/
		
		// 리스트를 뷰페이지로 넘겨준다.
		model.addAttribute("trendList", trendList);
		return "index";
	}

	@RequestMapping("/search")
	public String search(HttpServletRequest request, Model model, HttpSession session) {
		logger.info("search page");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String searchval = request.getParameter("searchval");
		if (searchval != null) { // 넘어온 검색어가 있으면 세션에 검색어를 저장
			searchval = searchval.trim().length() == 0 ? "" : searchval;
			session.setAttribute("searchval", searchval);
		} else { // 검색어가 없으면 세션에 저장된 검색어 읽음
			searchval = (String) session.getAttribute("searchval");
		}
	
		/*
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		TrendList trendList = ctx.getBean("TrendList", TrendList.class);
		trendList.setList(mapper.contentSearch(searchval));
		model.addAttribute("TrendList", trendList);
		ctx.close();
		 */
		
		// 검색 리스트를 불러온다.
		int totalCount = mapper.selectCount();
		TrendList trendList = new TrendList(20, totalCount, 1); // 페이지사이즈를 20으로
		trendList.setList(mapper.contentSearch(searchval));
		System.out.println("===============>" + trendList.getList().size());
		
		// 리스트의 트렌드 글 하나(VO)마다 댓글 수를 얻어와 저장한다
		/*
		for (int i = 0; i < trendList.getList().size(); i++) {
			int ccount = mapper.selectCommentCount(trendList.getList().get(i).getTnum());
			trendList.getList().get(i).setCcount(ccount);
		}
		*/
		// 리스트를 뷰페이지로 넘겨준다.
		model.addAttribute("trendList", trendList);
		
		
		return "index";
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		logger.info("content page");
		return "content";
	}

	@RequestMapping("/game1")
	public String game1(HttpServletRequest request, Model model) {
		logger.info("game content1 page");
		return "game1";
	}
	
	// ================================================== 현담 =================================================
	
	// 구조적으로 문제가 있음 ... =>js 사용으로 네이버댓글 처럼 리다이렉트 없이 구현할 것
	@RequestMapping("/list")
	// 전체 리스트 불러오고 hidden 상태에서 버튼 누르면 +6개씩
	public String list(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러 리스트 메소드 실행");
		// 맵퍼를 불러온다
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		// 전체 리스트를 불러온다.
		int totalCount = mapper.selectCount();
		TrendList trendList = new TrendList(totalCount, totalCount, 1); // 페이지사이즈를 totalCount로
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", trendList.getStartNo());
		hmap.put("endNo", trendList.getEndNo());
		trendList.setList(mapper.selectList(hmap));
		System.out.println("===============>" + trendList.getList().size());
		
		// 리스트의 트렌드 글 하나(VO)마다 댓글 수를 얻어와 저장한다
		for (int i = 0; i < trendList.getList().size(); i++) {
			int ccount = mapper.selectCommentCount(trendList.getList().get(i).getTnum());
			trendList.getList().get(i).setCcount(ccount);
		}
		
		// 리스트를 뷰페이지로 넘겨준다.
		model.addAttribute("trendList", trendList);
		
		return "list";
	}
	
	
	//========================================= + 수미 ====================================================
	
	
	@RequestMapping("/selectByTnum")
	public String selectByTnum(HttpServletRequest request, Model model, CommentList commentList) {
		logger.info("HomeController 클래스의 selectByTnum() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		int cnum = mapper.selectCountComment(tnum);
		TrendVO vo = mapper.selectByTnum(tnum);
		commentList = new CommentList();
		commentList.setList(mapper.selectCommentList(tnum));
		model.addAttribute("vo", vo);
		model.addAttribute("commentList", commentList);
		return "contentViewTrend";
	}
	
	@RequestMapping("/insertcommentOK")
	public String insertcommentOK(HttpServletRequest request, Model model, CommentVO co) {
		logger.info("HomeController 클래스의 insertcommentOK() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String check_memo = request.getParameter("memo");
		// String nickname = request.getParameter("nickname");
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		Date cdate = new Date();
		if (check_memo == "") {
			request.setAttribute("msg", "댓글을 입력해주세요.");
			return "alert";
		} else {
			co.setMemo(check_memo);
			// co.setNickname(nickname);
			co.setCdate(cdate);
			co.setTnum(tnum);
			mapper.insertComment(co);
		}
		return selectByTnum(request, model, null);
	}
			
	@RequestMapping("/deletecommentOK")
	public String deletecommentOK(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 deletecommentOK() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		// System.out.println(cnum);
		mapper.deleteComment(cnum);

		return selectByTnum(request, model, null);
	}
	
	@RequestMapping("/report")
	public String report(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 report() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("rnum", rnum);
		hmap.put("cnum", cnum);
		mapper.report(hmap);
		return selectByTnum(request, model, null);
	}
	
	@RequestMapping("/scrap")
	public String scrap(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 scrap() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		// System.out.println(tnum);
		// String nickname = request.getParameter("nickname");
		// Param param = new Param(tnum, nickname);
		// mapper.scrap(param);
		mapper.insertScrap(tnum);
		
//		int scrap = mapper.scrapCheck(nickname, tnum);
//		if (scrap == 0) {
//			mapper.insertScrap(tnum);
//		} else if (scrap == 1) {
//			mapper.scrapCancel(nickname, tnum);
//		} 
		return selectByTnum(request, model, null);
	}
	
	@RequestMapping("/tlike")
	public String tlike(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 tlike() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		int lnum = Integer.parseInt(request.getParameter("lnum"));
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("tnum", tnum);
		hmap.put("lnum", lnum);
		mapper.insertTrendLike(hmap);
		
		return selectByTnum(request, model, null);
	}
	
	@RequestMapping("/clike")
	public String clike(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 clike() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int lcnum = Integer.parseInt(request.getParameter("lcnum"));
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("cnum", cnum);
		hmap.put("lcnum", lcnum);
		mapper.insertCoLike(hmap);
		
		return selectByTnum(request, model, null);
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model, CommentList commentList) {
		logger.info("HomeController 클래스의 update() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		commentList.setList(mapper.selectCommentListCnum(cnum));
		model.addAttribute("commentList", commentList);
		return "update";
	}
	
	@RequestMapping("/updatecommentOK")
	public String update(HttpServletRequest request, Model model, CommentVO co) {
		logger.info("HomeController 클래스의 update() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		String check_memo = request.getParameter("memo");
		if (check_memo == "") {
			request.setAttribute("msg", "후기를 입력해주세요.");
			return "alert";
		} else {
			String memo = request.getParameter("memo");
			Param param = new Param(cnum, memo);
			mapper.updateComment(param);
		}
		
		return selectByTnum(request, model, null);
	}
	
	@RequestMapping("/numbaseball")
	public String numbaseball(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 numbaseball() 메소드 실행");
		
		return "numbaseball";
	}
	
	//========================================= + 형빈 ====================================================
	 /* 회원가입 페이지 */
    @RequestMapping("SignUp")
    public String SignUp()
    {
        return "SignUp";
    }


    /* 닉네임 중복 체크 */
    @ResponseBody
    @RequestMapping(value = "/NickCheck", method = RequestMethod.GET)
    public int NickCheck(@RequestParam("nickname") String nickname)
    {
        /* 닉네임이 있으면 1, 없으면 0 return */
        MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
        mapper.NickCheck(nickname);

        return mapper.NickCheck(nickname);
    }


    /* 아이디 중복 체크 */
    @ResponseBody
    @RequestMapping(value = "/IdCheck", method = RequestMethod.GET)
    public int IdCheck(@RequestParam("userid") String userid)
    {
        /* ID가 있으면 1, 없으면 0 return */
        MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
        mapper.IdCheck(userid);

        return mapper.IdCheck(userid);
    }


    /* 회원가입 Controller */
    @ResponseBody
    @RequestMapping(value = "/SignUpOk", method = RequestMethod.POST)
    public void SignUpOk(@RequestParam(value = "nickname") String nickname, @RequestParam(value = "userid") String userid, @RequestParam(value = "pw") String pw, @RequestParam(value = "email") String email)
    {
        // 필요한 요소만을 mapper에 넘겨주기 위한 HashMap
        HashMap<String, String> map = new HashMap<>();
        map.put("nickname", nickname);
        map.put("userid", userid);
        map.put("pw", pw);
        map.put("email", email);

        MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
        mapper.SignUp(map);
    }


    /* 로그인 controller */
    @ResponseBody
    @RequestMapping(value = "/SignInOk", method = RequestMethod.POST)
    public int SignInOk(@RequestParam(value = "userid") String userid, @RequestParam(value = "pw") String pw)
    {
        // 필요한 요소만을 mapper에 넘겨주기 위한 HashMap
        HashMap<String, String> map = new HashMap<>();
        map.put("userid", userid);
        map.put("pw", pw);

        System.out.println(map);

        MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
        mapper.SignIn(map);

        System.out.println(mapper.SignIn(map));

        return mapper.SignIn(map);
    }
	
	
	
}


