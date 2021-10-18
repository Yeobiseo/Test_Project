package com.test.testweb;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	SqlSessionTemplate session;

	@Resource(name = "mainDAO")
	MainDAO dao;

	@Override
	public int signupMv(TUser tu) {
		return dao.signupMv(session, tu);
	}

	@Override
	public List<HashMap<String, String>> login(HashMap<String, String> map) {
		return dao.login(session, map);
	}

	@Override
	public int postingMv(TBoard tb) {
		return dao.postingMv(session, tb);
	}

	@Override
	public List<HashMap<String, String>> postList() {
		return dao.postList(session);
	}


	@Override
	public List<HashMap<String, String>> post(HashMap<String, String> map) {
		return dao.post(session, map);
	}

	@Override
	public int postDel(HashMap<String, String> map) {
		return dao.postDel(session, map);
	}

	@Override
	public int postUpdate(HashMap<String, String> map) {
		return dao.postUpdate(session, map);
	}

	@Override
	public List<HashMap<String, String>> reply(HashMap<String, String> map) {
		return dao.reply(session, map);
	}

	@Override
	public int replyInsert(TReply tr) {
		return dao.replyInsert(session, tr);
	}

	@Override
	public String idCheck(String id) {
		return dao.idCheck(session, id);
	}

	@Override
	public int reDel(HashMap<String, String> map) {
		return dao.reDel(session, map);
	}

	@Override
	public List<HashMap<String, String>> mypage(HashMap<String, String> map) {
		return dao.mypage(session, map);
	}

	@Override
	public List<HashMap<String, String>> myInfo(HashMap<String, String> map) {
		return dao.myInfo(session, map);
	}

	@Override
	public List<HashMap<String, String>> usermain(HashMap<String, String> map) {
		return dao.usermain(session, map);
	}


}
