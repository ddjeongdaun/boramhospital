package com.proj.doctor;

import java.sql.Timestamp;

public class ReservationDTO {
	private int no;
	private String memId;
	private String docId;
	private String reservation;
	private Timestamp regdate;
	private String docCheck;
	private String uName;	//의사이름
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getDocCheck() {
		return docCheck;
	}
	public void setDocCheck(String docCheck) {
		this.docCheck = docCheck;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	
}
