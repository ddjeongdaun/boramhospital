package com.proj.board;

public class PageMaker {
	private Criteria cri;
				//총 게시물개수, 시작페이지, 끝페이지
	private int totalCount, startPage, endPage;
	private boolean prev, next;
	//한페이지당 보여줄 페이지 개수
	private int displayPageNum=5;
	
	//calcData : 시작페이지,마지막페이지,이전/다음페이지 계산 메서드
	private void calcData() {
		endPage=(int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPage=(endPage-displayPageNum)+1;
		if(startPage<=0) startPage=1;
		
		int tempEndPage=(int)Math.ceil(totalCount/(double)cri.getPerPageNum());
		if(endPage>tempEndPage) {
			endPage=tempEndPage;
		}
		
		prev = startPage == 1? false : true;
		next = endPage * cri.getPerPageNum() < totalCount ? true : false;
	}
	
	//게시물 검색 목록처리
	private String searchKeyfieldKeyword;
	
	public String getSearchKeyfieldKeyword() {
		return searchKeyfieldKeyword;
	}

	public void setSearchKeyfieldKeyword(String keyField, String keyWord) {
		if(keyField==null || keyWord==null) {
			searchKeyfieldKeyword= "";
		}else {
			searchKeyfieldKeyword = "&keyField="+keyField+"&keyWord="+keyWord;
		}
	}

	public PageMaker() {
		super();
	}
	
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	
}
