package com.proj.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {
	int totalBoard(Map<String, Object> map);
	BoardDTO selectBoard(String num);
	//게시판 목록 및 페이징
	List<Map<String, Object>> selectBoardList(Map<String, Object> map);
	int write(BoardDTO dto);
	int updateReadCnt(String num);
	BoardDTO selectByNum(String num);
	int updateBoard(BoardDTO dto);
	int deleteBoard(String num);
	String selectByUid(String uId);
	int insertReply(BoardDTO dto);
	int maxNum();
	int updateReply(BoardDTO dto);
	int maxPos(HashMap<String, Object> map);
	int checkPos(HashMap<String, Object> map);
	int countPos(HashMap<String, Object> map);
	
	List<Map<String, Object>> search(Criteria cri);
	int totalSearch(Criteria cri);
	
	int checkBoard(String num);
	int checkBoard2(String num);
	int checkReboard(HashMap<String, Object> map);
	int delBoard(String num);
	int posUpdate(HashMap<String, Object> map);
}
