package com.test.testweb;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository(value = "characterDAO")
public class CharacterDAO {

	public int characterCreate(SqlSessionTemplate session, TCharacter tc) {
		return session.insert("character.characterCreate", tc);
	}

	public List<HashMap<String, String>> charList(SqlSessionTemplate session, String userId) {
		return session.selectList("character.charList", userId);
	}

	public List<HashMap<String, String>> charYn(SqlSessionTemplate session, String userId) {
		return session.selectList("character.charYn", userId);
	}

}
