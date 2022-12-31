package com.proj.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.board.BoardDTO;
import com.proj.community.MemberVO;
import com.proj.doctor.DepartmentDTO;
import com.proj.doctor.DoctorDTO;
import com.proj.doctor.ReservationDTO;

@Service
public class AdminServiceImp implements AdminService{
	
	@Autowired
	private AdminDAO dao;
	
	@Override
	public int checkAdmin(String uId) {
		return dao.checkAdmin(uId);
	}

	@Override
	public List<BoardDTO> allBoard() {
		return dao.allBoard();
	}

	@Override
	public MemberVO detailMember(int num) {
		return dao.detailMember(num);
	}

	@Override
	public int resetPw(HashMap<String, Object> map) {
		return dao.resetPw(map);
	}

	@Override
	public int checkMember(String uId) {
		return dao.checkMember(uId);
	}

	@Override
	public List<ReservationDTO> allReservation(HashMap<String, Object> map) {
		return dao.allReservation(map);
	}

	@Override
	public int countMember() {
		return dao.countMember();
	}

	@Override
	public int countDoctor() {
		return dao.countDoctor();
	}

	@Override
	public List<MemberVO> allMember(HashMap<String, Object> map) {
		return dao.allMember(map);
	}

	@Override
	public List<DoctorDTO> allDoctor(HashMap<String, Object> map) {
		return dao.allDoctor(map);
	}

	@Override
	public int countReservation() {
		return dao.countReservation();
	}

	@Override
	public DoctorDTO detailDoctor(int num) {
		return dao.detailDoctor(num);
	}

	@Override
	public int deleteMember(String uId) {
		return dao.deleteMember(uId);
	}

	@Override
	public int deleteDoctor(String uId) {
		return dao.deleteDoctor(uId);
	}

	@Override
	public int resetDoctorPw(HashMap<String, Object> map) {
		return dao.resetDoctorPw(map);
	}

	@Override
	public int insertDoctor(HashMap<String, Object> map) {
		return dao.insertDoctor(map);
	}

	@Override
	public DoctorDTO doctorIdCheck(String uId) {
		return dao.doctorIdCheck(uId);
	}

	@Override
	public List<DepartmentDTO> allDepartment() {
		return dao.allDepartment();
	}

	@Override
	public int insertDept(DepartmentDTO dto) {
		return dao.insertDept(dto);
	}

	@Override
	public DepartmentDTO deptnoCheck(int deptno) {
		return dao.deptnoCheck(deptno);
	}

	@Override
	public int deleteDepartment(String deptno) {
		return dao.deleteDepartment(deptno);
	}

	@Override
	public int checkDept(String deptno) {
		return dao.checkDept(deptno);
	}

	@Override
	public ReservationDTO reservationByNo(String no) {
		return dao.reservationByNo(no);
	}

	@Override
	public int deleteReservation(String no) {
		return dao.deleteReservation(no);
	}
	
}
