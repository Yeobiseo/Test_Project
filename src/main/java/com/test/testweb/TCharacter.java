package com.test.testweb;

import java.sql.Timestamp;

public class TCharacter {

	private String userId;
	private String charNo;
	private String charName;
	private int charAge;
	private String charPer1;
	private String charPer2;
	private String charPer3;
	private String charGender;
	private String deathYn;
	private String loveNo;
	private Timestamp insertDate;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCharNo() {
		return charNo;
	}

	public void setCharNo(String charNo) {
		this.charNo = charNo;
	}

	public String getCharName() {
		return charName;
	}

	public void setCharName(String charName) {
		this.charName = charName;
	}

	public int getCharAge() {
		return charAge;
	}

	public void setCharAge(int charAge) {
		this.charAge = charAge;
	}

	public String getCharPer1() {
		return charPer1;
	}

	public void setCharPer1(String charPer1) {
		this.charPer1 = charPer1;
	}

	public String getCharPer2() {
		return charPer2;
	}

	public void setCharPer2(String charPer2) {
		this.charPer2 = charPer2;
	}

	public String getCharPer3() {
		return charPer3;
	}

	public void setCharPer3(String charPer3) {
		this.charPer3 = charPer3;
	}

	public String getCharGender() {
		return charGender;
	}

	public void setCharGender(String charGender) {
		this.charGender = charGender;
	}

	public String getDeathYn() {
		return deathYn;
	}

	public void setDeathYn(String deathYn) {
		this.deathYn = deathYn;
	}

	public String getLoveNo() {
		return loveNo;
	}

	public void setLoveNo(String loveNo) {
		this.loveNo = loveNo;
	}

	public Timestamp getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Timestamp insertDate) {
		this.insertDate = insertDate;
	}

}
