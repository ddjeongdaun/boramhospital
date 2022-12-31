package com.proj.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDAO boardDao;
	
	//총 게시물 개수
	@Override
	public int totalBoard(Map<String, Object> map) {
		return boardDao.totalBoard(map);
	}

	//게시물 상세보기
	@Override
	public BoardDTO selectBoard(String num) {
		return boardDao.selectBoard(num);
	}
	
	//게시판 목록 + 페이징
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return boardDao.selectBoardList(map);
	}
	
	//게시물 등록
	@Override
	public int write(BoardDTO dto) {
		return boardDao.write(dto);
	}

	@Override
	public int updateReadCnt(String num) {
		return boardDao.updateReadCnt(num);
	}

	@Override
	public BoardDTO selectByNum(String num) {
		return boardDao.selectByNum(num);
	}

	@Override
	public int deleteBoard(String num) {
		return boardDao.deleteBoard(num);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		return boardDao.updateBoard(dto);
	}

	@Override
	public String selectByUid(String uId) {
		return boardDao.selectByUid(uId);
	}

	@Override
	public int insertReply(BoardDTO dto) {
		return boardDao.insertReply(dto);
	}

	@Override
	public int maxNum() {
		return boardDao.maxNum();
	}

	@Override
	public int updateReply(BoardDTO dto) {
		return boardDao.updateReply(dto);
	}

	@Override
	public int maxDepth(int ref) {
		return boardDao.maxDepth(ref);
	}

	@Override
	public int totalSearch(Criteria cri) {
		return boardDao.totalSearch(cri);
	}

	@Override
	public List<Map<String, Object>> search(Criteria cri) {
		return boardDao.search(cri);
	}

	@Override		//ref구하기
	public int checkBoard(String num) {
		return boardDao.checkBoard(num);
	}

	@Override		//depth구하기
	public int checkBoard2(String num) {
		return boardDao.checkBoard2(num);
	}

	@Override		//ref,depth 조건의 count(*)구하기
	public int checkReboard(HashMap<String, Object> map) {
		return boardDao.checkReboard(map);
	}
	
	@Override		//답변글이있는 게시글 삭제처리(update)
	public int delBoard(String num) {
		return boardDao.delBoard(num);
	}

}
