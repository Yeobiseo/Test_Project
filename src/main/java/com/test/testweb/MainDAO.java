package com.test.testweb;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository(value = "mainDAO")
public class MainDAO {

	public int signupMv(SqlSessionTemplate session, TUser tu) {
		return session.insert("main.signupMv", tu);
	}

	public List<HashMap<String, String>> login(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.selectList("main.login", map);
	}

	public int postingMv(SqlSessionTemplate session, TBoard tb) {
		return session.insert("main.postingMv", tb);
	}

	public List<HashMap<String, String>> postList(SqlSessionTemplate session) {
		return session.selectList("main.postList", null);
	}

	public List<HashMap<String, String>> post(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.selectList("main.post", map);
	}

	public int postDel(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.update("main.postDel", map);
	}

	public int postUpdate(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.update("main.postUpdate", map);
	}

	public List<HashMap<String, String>> reply(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.selectList("main.reply", map);
	}

	public int replyInsert(SqlSessionTemplate session, TReply tr) {
		return session.insert("main.replyInsert", tr);
	}

	public String idCheck(SqlSessionTemplate session, String id) {
		return session.selectOne("main.idCheck", id);
	}

	public int reDel(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.update("main.reDel", map);
	}

	public List<HashMap<String, String>> mypage(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.selectList("main.mypage", map);
	}

	public List<HashMap<String, String>> myInfo(SqlSessionTemplate session, HashMap<String, String> map) {
		return session.selectList("main.myInfo", map);
	}
}
