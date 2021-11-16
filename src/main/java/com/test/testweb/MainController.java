package com.test.testweb;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface MainController {

	public String signUp();

	public ModelAndView postUpage(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	String posting(HttpServletRequest request);
	
	ModelAndView signupMv(HashMap<String, String> map);

	ModelAndView postingMv(HashMap<String, String> map, HttpSession session);

	ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			HashMap<String, String> map);

	String index(HttpServletRequest request);

	ModelAndView post(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView postDel(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView postUpdate(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView replyInsert(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map, HttpSession session);

	ModelAndView postList(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map, HttpSession session);

	ModelAndView reDel(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView mypage(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView usermain(HashMap<String, String> map);

	String QnA();

	ModelAndView board();


}
