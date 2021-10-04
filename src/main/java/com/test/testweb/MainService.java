package com.test.testweb;

import java.util.HashMap;
import java.util.List;

public interface MainService {

	List<HashMap<String, String>> login(HashMap<String, String> map);

	int signupMv(TUser tu);

	int postingMv(TBoard tb);

	List<HashMap<String, String>> postList();

	List<HashMap<String, String>> post(HashMap<String, String> map);

	int postDel(HashMap<String, String> map);

	int postUpdate(HashMap<String, String> map);

	List<HashMap<String, String>> reply(HashMap<String, String> map);

	int replyInsert(TReply tr);

	String idCheck(String string);

	int reDel(HashMap<String, String> map);

	List<HashMap<String, String>> mypage(HashMap<String, String> map);

	List<HashMap<String, String>> myInfo(HashMap<String, String> map);

}
