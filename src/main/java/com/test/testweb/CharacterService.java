package com.test.testweb;

import java.util.HashMap;
import java.util.List;

public interface CharacterService {

	int characterCreate(TCharacter tc);

	List<HashMap<String, String>> charList(String userId);

	List<HashMap<String, String>> charYn(String userId);

}
