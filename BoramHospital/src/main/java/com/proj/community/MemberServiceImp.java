package com.proj.community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.doctor.DoctorDTO;
import com.proj.doctor.ReservationDTO;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired
	private MemberDAO dao;

	@Override	//회원가입
	public int member_insert(MemberVO vo) {
		return dao.member_insert(vo);
	}

	@Override	//회원정보불러오기
	public MemberVO member_select(String id) {
		return dao.member_select(id);
	}

	@Override	//로그인
	public MemberVO member_login(HashMap<String, Object> map) {
		return dao.member_login(map);
	}

	@Override	//아이디 중복확인
	public MemberVO member_id_check(String uId) {
		return dao.member_id_check(uId);
	}

	@Override	//회원정보수정
	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}

	@Override	//회원탈퇴
	public int member_delete(String id) {
		return dao.member_delete(id);
	}

	@Override
	public List<ZipcodeVO> selectZipcode(String area3) {
		return dao.selectZipcode(area3);
	}

	@Override
	public List<ReservationDTO> reservationList(String uId) {
		return dao.reservationList(uId);
	}

	@Override
	public int deleteReservation(int no) {
		return dao.deleteReservation(no);
	}

	@Override
	public DoctorDTO searchDoctor(HashMap<String, Object> map) {
		return dao.searchDoctor(map);
	}

	@Override
	public int reservation(HashMap<String, Object> map) {
		return dao.reservation(map);
	}

	@Override
	public List<DoctorDTO> doctorByDeptno(String deptno) {
		return dao.doctorByDeptno(deptno);
	}

	@Override
	public DoctorDTO nameBydocId(String docId) {
		return dao.nameBydocId(docId);
	}
}
