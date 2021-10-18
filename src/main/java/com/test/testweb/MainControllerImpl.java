package com.test.testweb;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MainControllerImpl implements MainController {

	@Resource(name = "mainService")
	MainService ms;

	@Resource(name = "characterService")
	CharacterService cs;

	// 아이디 저장용 변수
	private String page = "";
	private String inputId = "";

	// 메인 페이지
	@Override
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView postList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map, HttpSession session) {

		// 게시글 목록
		List<HashMap<String, String>> postList = ms.postList();
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("list", postList);

		// 캐릭터 목록 (로그인이 됐을 경우)
		if (session.getAttribute("userList") != null) {
			List<HashMap<String, String>> charList = cs.charList(session.getAttribute("userId").toString());
			mav.addObject("charList", charList);

		// 캐릭터 생성가능 여부
		List<HashMap<String, String>> charYn = cs.charYn(session.getAttribute("userId").toString());
		mav.addObject("charYn", charYn);
		}

		if (page.equals("login")) {
			mav.addObject("inputId", inputId);
			inputId = "";
		} else
			mav.addObject("inputId", "");

		return mav;
	}

	// 로그인
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map) {
		List<HashMap<String, String>> userList = ms.login(map);

		ModelAndView mav = new ModelAndView("msg");

		if (userList.size() > 0) {
			request.getSession();
			session.setAttribute("userList", userList);
			session.setAttribute("userId", userList.get(0).get("USER_ID"));
			mav.setViewName("redirect:/");
		} else {
			page = "login";
			inputId = map.get("id");
			mav.addObject("msg", "아이디 또는 비밀번호를 확인하세요");
		}

		return mav;
	}

	// 로그아웃
	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("userList") != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	// 회원가입 페이지 이동
	@Override
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String signUp() {
		return "signUp";
	}

	// 회원가입 데이터 저장
	@Override
	@RequestMapping(value = "/signupMv.do", method = RequestMethod.POST)
	public ModelAndView signupMv(@RequestParam HashMap<String, String> map) {
		ModelAndView mav = new ModelAndView("msg");

		TUser tu = new TUser();
		tu.setUserId(map.get("id"));
		tu.setUserPwd(map.get("pwd"));

		try {
			int rtn = ms.signupMv(tu);

			if (rtn > 0) {
				mav.addObject("msg", "가입 완료");
				return mav;
			} else {
				mav.addObject("msg", "가입 실패. 다시 시도 해 주세요.");
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("msg", "에러!");
			return mav;
		}

	}

	// 글쓰기 페이지 이동
	@Override
	@RequestMapping(value = "/posting.do", method = RequestMethod.GET)
	public String posting() {
		return "posting";
	}

	// 글쓰기 데이터 저장
	@Override
	@RequestMapping(value = "/postingMv.do", method = RequestMethod.POST)
	public ModelAndView postingMv(@RequestParam HashMap<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		TBoard tb = new TBoard();
		tb.setTitle(map.get("title"));
		tb.setContent(map.get("content"));
		tb.setUserId(session.getAttribute("userId").toString());

		mav.setViewName("msg");
		try {
			int rtn = ms.postingMv(tb);
			if (rtn > 0) {
				mav.addObject("msg", "작성 완료");
				return mav;
			} else {
				mav.addObject("msg", "업로드 실패. 다시 시도 해 주세요.");
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("msg", "에러!");
			return mav;
		}
	}

	// 작성글 상세보기
	@Override
	@RequestMapping(value = "/post.do", method = RequestMethod.GET)
	public ModelAndView post(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map) {
		List<HashMap<String, String>> post = ms.post(map);
		List<HashMap<String, String>> reply = ms.reply(map);

		ModelAndView mav = new ModelAndView("post");
		mav.addObject("list", post);
		mav.addObject("reply", reply);
		return mav;
	}

	// 작성글 삭제
	@Override
	@RequestMapping(value = "/postDel.do", method = RequestMethod.GET)
	public ModelAndView postDel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg");
		try {
			int rtn = ms.postDel(map);

			if (rtn > 0) {
				mav.addObject("msg", "삭제 됐누");
				return mav;
			} else {
				mav.addObject("msg", "삭제 실패했누");
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("msg", "에러!");
			return mav;
		}
	}

	// 작성글 수정 페이지 이동
	@Override
	@RequestMapping(value = "/postUpage.do", method = RequestMethod.POST)
	public ModelAndView postUpage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map) {
		List<HashMap<String, String>> post = ms.post(map);
		ModelAndView mav = new ModelAndView("postUpage");
		mav.addObject("list", post);
		return mav;
	}

	// 작성글 수정 데이터 저장
	@Override
	@RequestMapping(value = "/postUpdate.do", method = RequestMethod.POST)
	public ModelAndView postUpdate(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg");
		try {
			int rtn = ms.postUpdate(map);

			if (rtn > 0) {
				mav.addObject("msg", "수정 됐누");
				return mav;
			} else {
				mav.addObject("msg", "수정 실패했누");
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("msg", "에러!");
			return mav;
		}
	}

	// 댓글 데이터 저장
	@Override
	@RequestMapping(value = "/replyInsert.do", method = RequestMethod.POST)
	public ModelAndView replyInsert(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map, HttpSession session) {

		ModelAndView mav = new ModelAndView();



		TReply tr = new TReply();
		tr.setNo(map.get("no"));
		tr.setRecontent(map.get("recontent"));
		tr.setUserId(session.getAttribute("userId").toString());

		mav.setViewName("msgreplay");
		try {
			int rtn = ms.replyInsert(tr);
			mav.addObject("no", map.get("no"));
			if (rtn > 0) {
				mav.addObject("msg", "댓글 올라갔누");
				return mav;
			} else {
				mav.addObject("msg", "댓글 안올라갔누");
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("msg", "에러!");
			return mav;
		}
	}

	// 날씨 여행지 정보 가져오기 테스트
	@SuppressWarnings("all")
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(HttpServletRequest request, HttpServletResponse response) {
		try {
			String urlStr = "http://apis.data.go.kr/1360000/TourStnInfoService/getTourStnWthrIdx?ServiceKey=%2BgvdZknwfI9SkVlsApRoooatYw8pRkMt6V2%2BHIyiRJjDj6qzgibs2HN3KDmlp9wJ2YYMlTN3qqBRpQIPqJMjiQ%3D%3D&pageNo=1&numOfRows=10&dataType=xml&CURRENT_DATE=2021090301&HOUR=24&COURSE_ID=55";
			// 가져온 주소 OPEN 200이면 성공
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			int responseCode = conn.getResponseCode();

			// conn에 담긴 값들을 버퍼에 담음
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			String xml = IOUtils.toString(br);

			JSONObject jp = XML.toJSONObject(xml);

			String str = jp.toString();

			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<String, Object>();
			map = objectMapper.readValue(str, new TypeReference<Map<String, Object>>() {
			});

			Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
			Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");

			Map<String, Object> items = null;
			List<Map<String, Object>> itemList = null;

			items = (Map<String, Object>) body.get("items");
			itemList = (List<Map<String, Object>>) items.get("item");

			request.setAttribute("list", itemList);

		} catch (Exception e) {
			System.out.println("에러났누");
		}

		return "test";

	}

	@ResponseBody
	@RequestMapping(value = "/idcheck.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String idCheck(HttpServletRequest request, @RequestBody HashMap<String, String> map) {
		String rtn = ms.idCheck(map.get("val"));
		return rtn;
	}

	//댓글 삭제
	@Override
	@RequestMapping(value = "/reDel.do", method = RequestMethod.GET)
	public ModelAndView reDel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("msg");
		try {
			int rtn = ms.reDel(map);

			if (rtn > 0) {
				mav.addObject("msg", "삭제 됐누");
				mav.addObject("url", map.get("post"));
				return mav;
			} else {
				mav.addObject("msg", "삭제 실패했누");
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("msg", "에러!");
			return mav;
		}
	}


	//마이페이지 목록
	@Override
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> map) {
		// map -> id=kmk

		// 글목록 가져오기
		List<HashMap<String, String>> mypage = ms.mypage(map);

		// 가입정보 가져오기
		List<HashMap<String, String>> myInfo = ms.myInfo(map);

		// 페이지 셋팅
		ModelAndView mav = new ModelAndView("mypage");
		mav.addObject("list", mypage);
		mav.addObject("info", myInfo);
		return mav;
	}



}
