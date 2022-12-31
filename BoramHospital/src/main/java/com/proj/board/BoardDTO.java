package com.proj.board;

public class BoardDTO {
	private int num;
    private String uId,uName,subject,content;
	private int pos, ref, depth;
	private String regTM;
	private String ip;
	private int readCnt;
	private String fileName;
	private int fileSize;
	private boolean checkDel;
	
	public BoardDTO() {
		super();
	}
	
	public BoardDTO(int num, String uId, String uName, String subject, String content, int pos, int ref, int depth,
			String regTM, String ip, int readCnt, String fileName, int fileSize) {
		super();
		this.num = num;
		this.uId = uId;
		this.uName = uName;
		this.subject = subject;
		this.content = content;
		this.pos = pos;
		this.ref = ref;
		this.depth = depth;
		this.regTM = regTM;
		this.ip = ip;
		this.readCnt = readCnt;
		this.fileName = fileName;
		this.fileSize = fileSize;
	}
	
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
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getRegTM() {
		return regTM;
	}
	public void setRegTM(String regTM) {
		this.regTM = regTM;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public boolean isCheckDel() {
		return checkDel;
	}

	public void setCheckDel(boolean checkDel) {
		this.checkDel = checkDel;
	}
	
}
