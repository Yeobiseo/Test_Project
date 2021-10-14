package com.test.testweb;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CharacterControllerImpl implements CharacterController {

	@Resource(name = "characterService")
	CharacterService cs;

	// 캐릭터 생성
	@Override
	@RequestMapping(value = "/characterCreate.do", method = RequestMethod.POST)
	public ModelAndView characterCreate(@RequestParam HashMap<String, String> map, HttpSession session) {

		ModelAndView mav = new ModelAndView("msg");

		TCharacter tc = new TCharacter();
		tc.setUserId(session.getAttribute("userId").toString());
		tc.setCharName(map.get("id"));
		tc.setCharGender(map.get("gender").equals("male") ? "M" : "F");
		tc.setCharPer1(map.get("type1"));
		tc.setCharPer2(map.get("type2"));
		tc.setCharPer3(map.get("type3"));

		try {
			int rtn = cs.characterCreate(tc);

			if (rtn > 0) {
				mav.addObject("msg", "캐릭터 생성완료");
				return mav;
			} else {
				mav.addObject("msg", "생성 실패. 다시 시도 해 주세요.");
				return mav;
			}
		} catch (Exception e) {
			mav.addObject("msg", "에러!");
			return mav;
		}

	}

}
