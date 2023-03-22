package com.proj.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate sql;
	
	//총 데이터 개수(게시물)
	public int totalBoard(Map<String, Object> map) {
		return sql.selectOne("member.totalBoard",map);
	}
	
	//게시물 상세보기
	public BoardDTO selectBoard(String num) {
		return sql.selectOne("member.selectBoard",num);
	}
	
	//게시판 목록 + 페이징
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
	    return sql.selectList("member.selectBoardList", map);
	}
	
	//게시물 등록
	public int write(BoardDTO dto) {
		return sql.insert("member.write", dto);
	}
	
	//조회수 증가
	public int updateReadCnt(String num) {
		return sql.update("member.updateReadCnt", num);
	}
	
	//답변-> 번호로 원게시물 정보 불러오기
	public BoardDTO selectByNum(String num) {
		return sql.selectOne("member.selectByNum", num);
	}
	
	//답변글 처리
	public int insertReply(BoardDTO dto) {
		return sql.insert("member.insertReply", dto);
	}
	
	//답변글 등록 후 ref,pos,depth조정
	public int updateReply(BoardDTO dto) {
		return sql.update("member.updateReply", dto);
	}
	
	//최대pos구하기
	public int maxPos(HashMap<String, Object> map) {
		return sql.selectOne("member.maxPos", map);
	}
	
	//depth와 ref가 동일한 게시물 개수 체크
	public int checkPos(HashMap<String, Object> map) {
		return sql.selectOne("member.checkPos", map);
	}
	
	//게시물 수정
	public int updateBoard(BoardDTO dto) {
		return sql.update("member.updateBoard", dto);
	}
	
	//게시물 삭제
	public int deleteBoard(String num) {
		return sql.delete("member.deleteBoard", num);
	}
	
	//아이디-boarddto연결
	public String selectByUid(String uId) {
		return sql.selectOne("member.selectByUid", uId);
	}
	
	//최대 번호구하기
	public int maxNum() {
		return sql.selectOne("member.maxNum");
	}
	
	//검색-list
	public List<Map<String, Object>> search(Criteria cri){
		return sql.selectList("member.search",cri);
	}
	
	//검색-total
	public int totalSearch(Criteria cri) {
		return sql.selectOne("member.totalSearch", cri);
	}

	//답변이 있는 게시물인지 확인
	public int checkBoard(String num) {
		return sql.selectOne("member.checkBoard", num);
	}
	
	//게시물의 ref,depth별 카운트확인
	public int checkReboard(HashMap<String, Object> map) {
		return sql.selectOne("member.checkReboard", map);
	}
	
	//답변이 있는 게시물인지 확인2
	public int checkBoard2(String num) {
		return sql.selectOne("member.checkBoard2", num);
	}
	
	//답변이 있는 게시물 삭제 처리
	public int delBoard(String num) {
		return sql.delete("member.delBoard", num);
	}
	
	//pos업데이트
	public int posUpdate(HashMap<String, Object> map) {
		return sql.update("member.posUpdate", map);
	}
	
	//같은 pos 게시물 개수 체크
	public int countPos(HashMap<String, Object> map) {
		return sql.selectOne("member.countPos",map);
	}
}
