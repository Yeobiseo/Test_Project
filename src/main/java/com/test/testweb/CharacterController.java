package com.test.testweb;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface CharacterController {

	ModelAndView characterCreate(HashMap<String, String> map, HttpSession session);

}
