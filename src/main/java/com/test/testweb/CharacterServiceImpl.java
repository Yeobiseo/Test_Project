package com.test.testweb;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "characterService")
public class CharacterServiceImpl implements CharacterService {

	@Autowired
	SqlSessionTemplate session;

	@Resource(name = "characterDAO")
	CharacterDAO dao;

	@Override
	public int characterCreate(TCharacter tc) {
		return dao.characterCreate(session, tc);
	}

	@Override
	public List<HashMap<String, String>> charList(String userId) {
		return dao.charList(session, userId);
	}

	@Override
	public List<HashMap<String, String>> charYn(String userId) {
		return dao.charYn(session, userId);
	}

}
