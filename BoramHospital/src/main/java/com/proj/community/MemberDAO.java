package com.proj.community;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.doctor.DoctorDTO;
import com.proj.doctor.ReservationDTO;

@Repository
public class MemberDAO implements MemberService{

	@Autowired
	SqlSessionTemplate sql; // 필드-클래스의 변수
	//만들어둔 SqlSession을 이용하기 위해 Autowired를 사용한다
	
	//회원가입
	public int member_insert(MemberVO vo) {
		return sql.insert("member.insert",vo);
	}
	
	//회원 정보 불러오기
	public MemberVO member_select(String uId) {
		return sql.selectOne("member.member_select", uId);
	}
	
	//회원정보 수정하기
	public int updateMember(MemberVO vo) {
		return sql.update("member.updateMember", vo);
	}
	
	//로그인
	public MemberVO member_login(HashMap<String, Object> map) {
		return sql.selectOne("member.login", map);
	}

	//아이디 중복확인
	public MemberVO member_id_check(String uId) {
		return sql.selectOne("member.checkId", uId);
	}

	//회원탈퇴하기
	public int member_delete(String uId) {
		return sql.delete("delete_member", uId);
	}
	
	//우편번호 조회
	public List<ZipcodeVO> selectZipcode(String area3){
		return sql.selectList("member.selectZipcode",area3);
	}
	
	//예약내역 조회
	public List<ReservationDTO> reservationList(String uId){
		return sql.selectList("member.reservationList", uId);
	}
	
	//예약내역 삭제
	public int deleteReservation(int no) {
		return sql.delete("member.deleteReservation", no);
	}
	
	//의사이름,진료과로 조회하기
	public DoctorDTO searchDoctor(HashMap<String, Object> map) {
		return sql.selectOne("member.searchDoctor", map);
	}
	
	//예약하기
	public int reservation(HashMap<String, Object> map) {
		return sql.insert("member.reservation", map);
	}
	
	//진료과 별 의사 조회하기
	public List<DoctorDTO> doctorByDeptno(String deptno) {
		return sql.selectList("member.doctorByDeptno",deptno);
	}
	
	//의사아이디로 이름 조회하기
	public DoctorDTO nameBydocId(String docId) {
		return sql.selectOne("member.nameBydocId", docId);
	}
}
