package com.proj.admin;

import java.util.HashMap;
import java.util.List;

import com.proj.board.BoardDTO;
import com.proj.community.MemberVO;
import com.proj.doctor.DepartmentDTO;
import com.proj.doctor.DoctorDTO;
import com.proj.doctor.ReservationDTO;

public interface AdminService {
	int checkAdmin(String uId);
	int checkMember(String uId);
	List<MemberVO> allMember(HashMap<String, Object> map);
	MemberVO detailMember(int num);
	int resetPw(HashMap<String, Object> map);
	List<BoardDTO> allBoard();
	List<DoctorDTO> allDoctor(HashMap<String, Object> map);
	List<ReservationDTO> allReservation(HashMap<String, Object> map);
	int countMember();
	int countDoctor();
	int countReservation();
	DoctorDTO detailDoctor(int num);
	int deleteMember(String uId);
	int deleteDoctor(String uId);
	int resetDoctorPw(HashMap<String, Object> map);
	int insertDoctor(HashMap<String, Object> map);
	DoctorDTO doctorIdCheck(String uId);
	List<DepartmentDTO> allDepartment();
	int insertDept(DepartmentDTO dto);
	DepartmentDTO deptnoCheck(int deptno);
	int deleteDepartment(String deptno);
	int checkDept(String deptno);
	ReservationDTO reservationByNo(String no);
	int deleteReservation(String no);
}
