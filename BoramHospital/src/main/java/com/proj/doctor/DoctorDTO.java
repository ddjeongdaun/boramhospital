package com.proj.doctor;

import java.sql.Timestamp;

public class DoctorDTO{
	private int num;
	private String uId;
	private String uPw;
	private String uName;
	private String uEmail;
	private String position;
	private int deptno;
	private Timestamp joinTM;
	
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
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public Timestamp getJoinTM() {
		return joinTM;
	}
	public void setJoinTM(Timestamp joinTM) {
		this.joinTM = joinTM;
	}
	
	
}
