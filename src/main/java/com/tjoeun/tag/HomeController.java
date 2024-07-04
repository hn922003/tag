package com.tjoeun.tag;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.tjoeun.tag.vo.MycommentVO;
import com.tjoeun.tag.vo.Param;
import com.tjoeun.tag.vo.TrendList;
import com.tjoeun.tag.vo.TrendVO;
import com.tjoeun.tag.vo.UserVO;

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
		
		// 인덱스에 랜덤으로 20개의 리스트를 불러온다.
		int totalCount = mapper.selectCount();
		TrendList trendList = new TrendList(20, totalCount, 1); // 페이지사이즈를 20으로
		trendList.setList(mapper.contentList());
		System.out.println("===============>" + trendList.getList().size());
		
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
	
		// 검색 리스트를 불러온다.
		int totalCount = mapper.selectCount();
		TrendList trendList = new TrendList(20, totalCount, 1); // 페이지사이즈를 20으로
		trendList.setList(mapper.contentSearch(searchval));
		//System.out.println("===============>" + trendList.getList().size());
		
		// 리스트를 뷰페이지로 넘겨준다.
		model.addAttribute("trendList", trendList);
		model.addAttribute("searchNum", trendList.getList().size());
		
		
		return "index";
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		logger.info("content page");
		return "content";
	}
	
	@RequestMapping("/rps")
	public String rps(HttpServletRequest request, Model model) {
	      // logger.info("game content1 page");
		return "rps";
	}
	   
	@RequestMapping("/yabaui")
    public String yabaui(HttpServletRequest request, Model model) {
		// logger.info("game content1 page");
		return "yabaui";
	}
	   
	
	// ================================================== 현담 =================================================
	
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

		model.addAttribute("trendList", trendList);
		
		return "list";
	}
	
	// 게임 리스트 페이지로
	@RequestMapping("/list2")
	public String list2(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러 리스트2 메소드 실행");
		
		// 현재 완성된 게임 4가지 필수 출력 후 나머지 부분은 트렌트로 채움
		
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
		
		// 리스트를 뷰페이지로 넘겨준다.
		model.addAttribute("trendList", trendList);
		
		return "list2";
	}
	
	// 업다운 게임 페이지로 이동
	@RequestMapping("/updown") 
	public String updown(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러 home 메소드 실행 => 게임페이지 로딩");
		// 세션 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 정답 숫자 생성
		Random random = new Random();
		int answer = random.nextInt(100) + 1;
		
		// 뷰페이지로 전달
		model.addAttribute("answer", answer);
		model.addAttribute("chance", 10);
		
		return "updown";
	}
	
	// 업다운게임 - 정답제출
	@RequestMapping(value = "/answer", method = RequestMethod.POST)
	public String answer(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러 answer 메소드 실행 => 정답입력 후 로딩");
		int trynum = Integer.parseInt(request.getParameter("trynum"));//입력한 정답
		int answer = Integer.parseInt(request.getParameter("answer"));// 실제 정답
		model.addAttribute("answer", answer);
		int chance = Integer.parseInt(request.getParameter("chance"));// 남은 기회
		HttpSession session = request.getSession(); 
		
		System.out.println(trynum + "===============" + answer + "===========" + chance);
		ArrayList<Integer> prenums = null;
		try {// 입력한 정답 리스트 => 세션 저장
			prenums = (ArrayList<Integer>) session.getAttribute("prenums");
			// 찬스가 남아있고 정답이 아니면서 이전에 추측한 수가 아닐때 추가한다.
			if (chance > 0 && trynum != answer && prenums.indexOf(trynum) < 0) {
				prenums.add(trynum);
			}
			session.setAttribute("prenums", prenums);
		} catch (Exception e) {
			prenums = new ArrayList<Integer>();
			prenums.add(trynum);
			session.setAttribute("prenums", prenums);
		}
		
		if (chance >= 1) { // 시도 횟수가 1 이상이면 게임 진행
			if (trynum == answer) { // 정답
				model.addAttribute("result", "와우~! 당신의 <span class='text-danger bg-success-subtle h4 fw-bold px-3'>승리</span>입니다." );
				model.addAttribute("result2", "정답은 <span class='text-danger h2 fw-bold'>" + answer + "</span> 입니다.");
				model.addAttribute("chance", 0);
				return "updown";
			} else if (trynum < answer) { // UP
				model.addAttribute("result", "<span class='text-danger'>Up <i class='bi bi-arrow-up-circle-fill'></i></span> " + (chance - 1) + "번의 기회가 남았습니다...");
				if (chance <= 4) {
					model.addAttribute("result", "<span class='text-danger'>Up <i class='bi bi-arrow-up-circle-fill'></i></span> " + (chance - 1) + "번 남았습니다...<span style='color:white; background-color:crimson;'>집중하세요!</span>");
				}
				int closeup = trynum;
				for (int num:prenums) { // 넘어온 값과 오답 값들을 비교해 최대값을 찾아서 넘겨준다
					if (num < answer) {// 오답값이 정답보다 작을때만
						closeup = num > closeup ? num:closeup;
					}
				}
				session.setAttribute("closeup", closeup);
			} else { // DOWN
				model.addAttribute("result", "<span class='text-primary'>Down <i class='bi bi-arrow-down-circle-fill'></i></span> " + (chance - 1) + "번의 기회가 남았습니다...");
				if (chance <= 4) {
					model.addAttribute("result", "<span class='text-primary'>Down <i class='bi bi-arrow-down-circle-fill'></i></span> <span style='color:white; background-color:crimson;'>" + (chance - 1) + "번 남았습니다...집중하세요!</span>");
				}
				int closedown = trynum;
				for (int num:prenums) { // 넘어온 값과 오답 값들을 비교해 최소값을 찾아서 넘겨준다
					if (num > answer) {// 오답값이 정답보다 클때만
						closedown = num < closedown ? num:closedown;
					}
				}
				session.setAttribute("closedown", closedown);
			}
			model.addAttribute("chance", chance - 1); // 시도횟수 -1
			
			// 패배조건 chance == 1
			if (chance == 1) { // 시도횟수가 1이면
				model.addAttribute("result", "안타깝네요!... 당신의 <span class='text-primary bg-success-subtle h4 fw-bold px-3'>패배</span>입니다.");
				model.addAttribute("result2", "정답은 <span class='text-danger h2 fw-bold'>" + answer + "</span> 입니다.");
				model.addAttribute("chance", chance - 1);
				return "updown";
			}
		}
		return "updown";
	}
	
	// 업다운 게임 - 새로운 게임
	@RequestMapping("/restart")
	public String restart(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러 restart 메소드 실행 => 새로운 게임페이지 로딩");
		//return home(request, model);
		return updown(request, model);
	}
	
	//========================================= + 수미 ====================================================
	
	@RequestMapping("/selectByTnum")
	public String selectByTnum(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 selectByTnum() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		TrendVO vo = mapper.selectByTnum(tnum);
		int totalComment = mapper.selectCountComment(tnum);
		// 댓글 리스트
		CommentList commentList = new CommentList(totalComment, totalComment, 1);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", commentList.getStartNo());
		hmap.put("endNo", commentList.getEndNo());
		hmap.put("tnum", tnum);
		commentList.setList(mapper.selectCommentList(hmap));
		
		// writer가 작성한 또 다른 글
		TrendList trendList = new TrendList();
		HashMap<String, String> hmap2 = new HashMap<String, String>();
		hmap2.put("title", vo.getTitle());
		hmap2.put("writer", vo.getWriter());
		trendList.setList(mapper.selectWriterTitle(hmap2));
		
		model.addAttribute("vo", vo);
		model.addAttribute("commentList", commentList);
		model.addAttribute("trendList", trendList);
		return "contentViewTrend";
	}
	
	// 닉네임 => 형빈이 추가 코딩으로 변경
	@RequestMapping("/insertcommentOK")
	public String insertcommentOK(HttpServletRequest request, Model model, CommentVO co, HttpSession session) {
		logger.info("HomeController 클래스의 insertcommentOK() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String check_memo = request.getParameter("memo");
		// String nickname = request.getParameter("nickname");

		String nickname = (String) session.getAttribute("nickname");
		int usernum = (int) session.getAttribute("usernum");

		int tnum = Integer.parseInt(request.getParameter("tnum"));
		Date cdate = new Date();
		if (check_memo == "") {
			request.setAttribute("msg", "댓글을 입력해주세요.");
			return "alert";
		} else {
			co.setMemo(check_memo);
			co.setNickname(nickname);
			co.setCdate(cdate);
			co.setTnum(tnum);
			co.setUsernum(usernum);
			mapper.insertComment(co);
		}
		return selectByTnum(request, model);
	}
			
	@RequestMapping("/deletecommentOK")
	public String deletecommentOK(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 deletecommentOK() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		// 댓글 삭제
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		// System.out.println(cnum);
		mapper.deleteComment(cnum);

		return selectByTnum(request, model);
	}
	
	@RequestMapping("/report")
	public String report(HttpServletRequest request, Model model, HttpSession session) {
		logger.info("HomeController 클래스의 report() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		// 댓글 신고
		int usernum = (int) session.getAttribute("usernum");
		System.out.println("usernum: " + usernum);
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		System.out.println("cnum: " + cnum);
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("usernum", usernum);
		hmap.put("rnum", rnum);
		hmap.put("cnum", cnum);
		int reportfirst = mapper.reportfirst(hmap);
		System.out.println("reportfirst: " + reportfirst);
		if (reportfirst == 0) {
			mapper.insertTrendReport(hmap);
			mapper.reportInsert(hmap);
			request.setAttribute("msg", "신고접수완료");
			request.setAttribute("url", "selectByTnum");
			return "alert";
		} else if (reportfirst != 0) {
			int report = mapper.report(hmap);
			System.out.println("report: " + report);
			if (report == 0) {
				mapper.insertTrendReport(hmap);
				mapper.reportUpdate(hmap);
				request.setAttribute("msg", "이미 신고하셨습니다.");
				request.setAttribute("url", "selectByTnum");
				return "alert";
			} else if (report > 0) {
				request.setAttribute("msg", "이미 신고하셨습니다.");
				request.setAttribute("url", "selectByTnum");
				return "alert";
			}
		}
		model.addAttribute("tnum", tnum);
		return selectByTnum(request, model);
	}
	
	@RequestMapping("/scrap")
	public String scrap(HttpServletRequest request, Model model, HttpSession session) {
		logger.info("HomeController 클래스의 scrap() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int usernum = (int) session.getAttribute("usernum");
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		int lnum = Integer.parseInt(request.getParameter("lnum"));
		// System.out.println("tnum: " + tnum + ", lnum: " + lnum + ", title: " + title + ", writer: " + writer);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("usernum", usernum);
		hmap.put("tnum", tnum);
		int scrapfirst = mapper.scrapfirst(hmap);
		Param param = new Param(tnum, lnum, usernum, title, writer);
		if (scrapfirst == 0) {
			mapper.scrapInsert(param);
			request.setAttribute("msg", "스크랩완료");
			return "alert";
		} else if (scrapfirst != 0) {
			int scrap = mapper.scrap(hmap);
			if (scrap == 0) {
				mapper.scrapUpdate(hmap);
				request.setAttribute("msg", "스크랩완료");
				return "alert";
			} else if (scrap > 0) {
				mapper.scrapDelete(hmap);
				request.setAttribute("msg", "스크랩취소");
				return "alert";
			}
		}
		return selectByTnum(request, model);
	}
	
	@RequestMapping("/tlike")
	public String tlike(HttpServletRequest request, Model model, HttpSession session) {
		logger.info("HomeController 클래스의 tlike() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		// 트렌드 좋아요
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		int lnum = Integer.parseInt(request.getParameter("lnum"));
		int usernum = (int) session.getAttribute("usernum");
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("tnum", tnum);
		hmap.put("lnum", lnum);
		hmap.put("usernum", usernum);
		hmap.put("tnum", tnum);
		System.out.println("usernum: " + usernum);
		int tlikefirst = mapper.tlikefirst(hmap);
		System.out.println("tlikefirst: " + tlikefirst);
		if (tlikefirst == 0) {
			mapper.insertTrendLike(hmap);
			mapper.tilkeInsert(hmap);
		} else if (tlikefirst != 0) {
			int tlike = mapper.tlike(hmap);
			if (tlike == 0) {
				mapper.insertTrendLike(hmap);
				mapper.tlikeUpdate(hmap);
			} else if (tlike > 0) {
				mapper.deleteTrendLike(hmap);
				mapper.tlikeDelete(hmap);
			}
		} 
		return selectByTnum(request, model);
	}
	
	@RequestMapping("/clike")
	public String clike(HttpServletRequest request, Model model, HttpSession session) {
		logger.info("HomeController 클래스의 clike() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		// 댓글 좋아요
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int lcnum = Integer.parseInt(request.getParameter("lcnum"));
		int usernum = (int) session.getAttribute("usernum");
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("cnum", cnum);
		hmap.put("lcnum", lcnum);
		hmap.put("usernum", usernum);
		System.out.println("usernum:" + usernum);
		int clikefirst = mapper.clikefirst(hmap);
		System.out.println("clikefirst: " + clikefirst);
		if (clikefirst == 0) {
			mapper.insertCoLike(hmap);
			mapper.clikeInsert(hmap);
		} else if (clikefirst != 0) {
			int clike = mapper.clike(hmap);
			if (clike == 0) {
				mapper.insertCoLike(hmap);
				mapper.clikeUpdate(hmap);
			} else if (clike > 0) {
				mapper.deleteCoLike(hmap);
				mapper.clikeDelete(hmap);
			}
		}
		model.addAttribute("tnum", tnum);
		return selectByTnum(request, model);
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model, CommentList commentList) {
		logger.info("HomeController 클래스의 update() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		// 댓글 수정페이지로 가기
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		commentList.setList(mapper.selectCommentListCnum(cnum));
		model.addAttribute("commentList", commentList);
		return "update";
	}
	
	@RequestMapping("/updatecommentOK")
	public String update(HttpServletRequest request, Model model, CommentVO co) {
		logger.info("HomeController 클래스의 update() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
	
		// 댓글 수정
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int tnum = Integer.parseInt(request.getParameter("tnum"));
		String check_memo = request.getParameter("memo");
		if (check_memo == "") {
			request.setAttribute("msg", "후기를 입력해주세요.");
			return "alert";
		} else {
			String memo = request.getParameter("memo");
			Param param = new Param(cnum, memo);
			mapper.updateComment(param);
		}
		
		return selectByTnum(request, model);
	}
	
	@RequestMapping("/numbaseball")
	public String numbaseball(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 numbaseball() 메소드 실행");
		return "numbaseball";
	}
	
	@RequestMapping("/baskinrobbins31")
	public String baskinrobbins31(HttpServletRequest request, Model model) {
		logger.info("HomeController 클래스의 baskinrobbins31() 메소드 실행");
		return "baskinrobbins31";
	}
	
	//========================================= + 형빈 ====================================================
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
		public void SignUpOk(@RequestParam(value = "nickname") String nickname,
							 @RequestParam(value = "userid") String userid,
							 @RequestParam(value = "pw") String pw,
							 @RequestParam(value = "email") String email,
							 @RequestParam(value = "birth", required = false) String birth) // 생년월일은 입력 안해도 무관하게 구성
		{
			// 필요한 요소만을 mapper에 넘겨주기 위한 HashMap
			HashMap<String, String> map = new HashMap<>();

			/* 가입 일자를 가져오기 위한 Date 생성 */
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateStr = simpleDateFormat.format(date);

			/* 회원가입에 필요한 요소를 map으로 묶기 */
			map.put("nickname", nickname);
			map.put("userid", userid);
			map.put("pw", pw);
			map.put("email", email);
			map.put("birth", birth);
			map.put("jdate",dateStr);

			/* DB에 insert하는 구문 실행 */
			MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
			mapper.SignUp(map);
		}

		/* 로그인 controller */
		@ResponseBody
		@RequestMapping(value = "/SignInOk", method = RequestMethod.POST)
		public String SignInOk(@RequestParam(value = "userid") String userid,
							   @RequestParam(value = "pw") String pw,
							   HttpSession session)
		{
			// 필요한 요소만을 mapper에 넘겨주기 위한 HashMap
			HashMap<String, String> map = new HashMap<>();
			map.put("userid", userid);
			map.put("pw", pw);

			MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
			if ((mapper.IdCheck(userid) + mapper.PwCheck(map)) == 2)
			{
				UserVO result = mapper.SignIn(map);
				session.setAttribute("nickname",result.getNickname());
				session.setAttribute("usernum",result.getUsernum());
				session.setAttribute("point",result.getPoint());

				System.out.println(result.getPoint());

				return result.getNickname();
			}
			else if((mapper.IdCheck(userid) + mapper.PwCheck(map)) == 1)
		{
			return "1";
		}
		else
		{
			return "0";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:index";
	}

	/* 내 정보 페이지로 이동 */
	@RequestMapping("/Myinfo")
	public String Myinfo(Model model,HttpSession session, HttpServletResponse response) throws IOException
	{
		if (session.getAttribute("nickname") != null)
		{
			MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
			UserVO uo = mapper.Myinfo((String) session.getAttribute("nickname"));
			int scrapCnt = mapper.scrapCnt((Integer) session.getAttribute("usernum"));
			model.addAttribute("scrapCnt",scrapCnt); 
			int commentCnt = mapper.commentCnt((String) session.getAttribute("nickname"));
			model.addAttribute("uo",uo);
			model.addAttribute("commentCnt",commentCnt);
			return "Myinfo";
		}
		else
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용 가능합니다.');location.href='./list'</script>");
			out.flush();
			return "index";
		}
	}

	@RequestMapping("/Scrap")
	public String Scrap(HttpSession session, HttpServletResponse response, Model model) throws IOException {
		if (session.getAttribute("nickname") != null)
		{
			MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
			UserVO uo = mapper.Myinfo((String) session.getAttribute("nickname"));
			model.addAttribute("uo",uo);
			return "Scrap";
		}
		else
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용 가능합니다.');location.href='./list'</script>");
			out.flush();
			return "index";
		}
	}

	@RequestMapping("/MyComment")
	public String MyComment(HttpSession session, HttpServletResponse response,HttpServletRequest request, Model model) throws IOException {
		if (session.getAttribute("nickname") != null)
		{
			List<MycommentVO> co = sqlSession.selectList("com.tjoeun.tag.dao.MybatisDAO.MyComment",session.getAttribute("usernum"));
			model.addAttribute("co",co);
			return "MyComment";
		}
		else
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용 가능합니다.');location.href='./list'</script>");
			out.flush();
			return "index";
		}
	}

	@RequestMapping("/MyScrap")
	public String MyScrap(HttpSession session, HttpServletResponse response,HttpServletRequest request, Model model) throws IOException {
		if (session.getAttribute("nickname") != null)
		{
			List<CommentVO> vo = sqlSession.selectList("com.tjoeun.tag.dao.MybatisDAO.MyScrap",session.getAttribute("usernum"));
			System.out.println("vo: " + vo);
			model.addAttribute("vo",vo);
			return "Scrap";
		}
		else
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용 가능합니다.');location.href='./list'</script>");
			out.flush();
			return "index";
		}
	}
	
}


