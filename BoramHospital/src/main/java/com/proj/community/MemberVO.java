package com.proj.community;

import java.sql.Timestamp;

public class MemberVO {
	private int num;
	private String uId;
	private String uPw;
	private String uName;
	private String uEmail;
	private String gender;
	private String uBirthday;
	private String uZipcode;
	private String uAddr;
	private String uHobby;
	private String uJob;
	private Timestamp joinTM;
	private int uAuth;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getuBirthday() {
		return uBirthday;
	}

	public void setuBirthday(String uBirthday) {
		this.uBirthday = uBirthday;
	}

	public String getuZipcode() {
		return uZipcode;
	}

	public void setuZipcode(String uZipcode) {
		this.uZipcode = uZipcode;
	}

	public String getuAddr() {
		return uAddr;
	}

	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}

	public String getuHobby() {
		return uHobby;
	}

	public void setuHobby(String uHobby) {
		this.uHobby = uHobby;
	}

	public String getuJob() {
		return uJob;
	}

	public void setuJob(String uJob) {
		this.uJob = uJob;
	}

	public Timestamp getJoinTM() {
		return joinTM;
	}

	public void setJoinTM(Timestamp joinTM) {
		this.joinTM = joinTM;
	}

	public int getuAuth() {
		return uAuth;
	}

	public void setuAuth(int uAuth) {
		this.uAuth = uAuth;
	}
	
	
	
}
