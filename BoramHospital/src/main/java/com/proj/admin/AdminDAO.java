package com.proj.admin;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.board.BoardDTO;
import com.proj.community.MemberVO;
import com.proj.doctor.DepartmentDTO;
import com.proj.doctor.DoctorDTO;
import com.proj.doctor.ReservationDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//관리자 체크
	public int checkAdmin(String uId) {
		return sql.selectOne("admin.checkAdmin", uId); 
	}
	
	//회원인지 체크
	public int checkMember(String uId) {
		return sql.selectOne("admin.checkMember", uId);
	}
	
	//전체 회원 리스트
	public List<MemberVO> allMember(HashMap<String, Object> map) {
		return sql.selectList("admin.allMember",map);
	}
	
	//전체 의사 리스트
	public List<DoctorDTO> allDoctor(HashMap<String, Object> map) {
		return sql.selectList("admin.allDoctor",map);
	}
	
	//회원 디테일
	public MemberVO detailMember(int num) {
		return sql.selectOne("admin.detailMember", num);
	}
	
	//회원 비밀번호 초기화
	public int resetPw(HashMap<String, Object> map) {
		return sql.update("admin.resetPw", map);
	}
	
	//의료진 디테일
	public DoctorDTO detailDoctor(int num) {
		return sql.selectOne("admin.detailDoctor", num);
	}
	
	//의료진 비밀번호 초기화
	public int resetDoctorPw(HashMap<String, Object> map) {
		return sql.update("admin.resetDoctorPw", map);
	}
	
	//전체 게시물 리스트
	public List<BoardDTO> allBoard() {
		return sql.selectList("admin.allBoard");
	}
	
	//예약리스트
	public List<ReservationDTO> allReservation(HashMap<String, Object> map){
		return sql.selectList("admin.allReservation", map);
	}
	
	//총 예약 수
	public int countReservation() {
		return sql.selectOne("admin.countReservation");
	}
	
	//총 회원수
	public int countMember() {
		return sql.selectOne("admin.countMember");
	}
	
	//총 의료진 수
	public int countDoctor() {
		return sql.selectOne("admin.countDoctor");
	}
	
	//회원삭제
	public int deleteMember(String uId) {
		return sql.delete("admin.deleteMember", uId);
	}
	
	//의료진삭제
	public int deleteDoctor(String uId) {
		return sql.delete("admin.deleteDoctor", uId);
	}
	
	//의료진 계정 생성
	public int insertDoctor(HashMap<String, Object> map) {
		return sql.insert("admin.insertDoctor", map);
	}
	
	//의료진 아이디 중복확인
	public DoctorDTO doctorIdCheck(String uId) {
		return sql.selectOne("admin.doctorIdCheck", uId);
	}
	
	//진료과 번호 중복확인
	public DepartmentDTO deptnoCheck(int deptno) {
		return sql.selectOne("admin.deptnoCheck", deptno);
	}
	
	//전체 진료과 조회
	public List<DepartmentDTO> allDepartment(){
		return sql.selectList("admin.allDepartment");
	}
	
	//진료과 등록
	public int insertDept(DepartmentDTO dto) {
		return sql.insert("admin.insertDept", dto);
	}
	
	//진료과 삭제
	public int deleteDepartment(String deptno) {
		return sql.delete("admin.deleteDepartment", deptno);
	}
	
	//진료과 사용여부 확인
	public int checkDept(String deptno){
		return sql.selectOne("admin.checkDept",deptno);
	}
	
	//번호로 진료예약내역 조회
	public ReservationDTO reservationByNo(String no) {
		return sql.selectOne("admin.reservationByNo", no);
	}
	
	//번호로 진료예약내역 삭제
	public int deleteReservation(String no) {
		return sql.delete("admin.deleteReservation", no);
	}
}
