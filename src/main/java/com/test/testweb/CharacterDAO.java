package com.test.testweb;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository(value = "characterDAO")
public class CharacterDAO {

	public int characterCreate(SqlSessionTemplate session, TCharacter tc) {
		return session.insert("character.characterCreate", tc);
	}

}
