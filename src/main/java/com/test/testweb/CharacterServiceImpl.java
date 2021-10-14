package com.test.testweb;

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

}
