package com.test.testweb;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface MainController {
	
	public String signUp();
	
	public String posting();
		
	public ModelAndView postUpage(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);
	
	ModelAndView signupMv(HashMap<String, String> map);

	ModelAndView postingMv(HashMap<String, String> map, HttpSession session);
	
	String login(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			HashMap<String, String> map);

	String index(HttpServletRequest request);

	ModelAndView postList(HttpServletRequest request, HttpServletResponse response);

	ModelAndView post(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView postDel(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView postUpdate(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map);

	ModelAndView replyInsert(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map,  HttpSession session);

}
