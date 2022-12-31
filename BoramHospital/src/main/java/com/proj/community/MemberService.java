package com.proj.community;

import java.util.HashMap;
import java.util.List;

import com.proj.doctor.DoctorDTO;
import com.proj.doctor.ReservationDTO;

public interface MemberService {
	//회원가입
	int member_insert(MemberVO vo);
	
	//회원정보 불러오기
	MemberVO member_select(String id);
	
	//회원정보 수정처리
	int updateMember(MemberVO vo);
	
	//로그인 처리
	//HashMap : 키와 밸류를 갖는 데이터 타입
	//Map : 사물함, Key : 열쇠, Value : 자료
	MemberVO member_login(HashMap<String, Object> map);
	
	//아이디 중복 확인
	MemberVO member_id_check(String uId);
	
	//회원 정보 탈퇴
	int member_delete(String id);
	
	//우편번호검색
	List<ZipcodeVO> selectZipcode(String area3);
	
	//예약리스트
	List<ReservationDTO> reservationList(String uId);
	
	//예약삭제
	int deleteReservation(int no);
	
	//의사조회
	DoctorDTO searchDoctor(HashMap<String, Object> map);
	
	//예약하기
	int reservation(HashMap<String, Object> map);
	
	//진료과 별 의사 조회하기
	List<DoctorDTO> doctorByDeptno(String deptno);
	
	//의사아이디로 이름조회하기
	DoctorDTO nameBydocId(String docId);
}
