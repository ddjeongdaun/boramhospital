package com.proj.doctor;

import java.util.HashMap;
import java.util.List;

import com.proj.community.MemberVO;

public interface DoctorService {
	DoctorDTO doctorLogin(HashMap<String, Object> map);
	int checkDoctor(String uId);
	DoctorDTO selectById(String uId);
	DepartmentDTO getDeptName(int deptno);
	int delete_doctor(String uId);
	List<ReservationDTO> myReservation(String uId);
	ReservationDTO reservationDetail(int no);
	int docCheckUpdate(HashMap<String, Object> map);
	MemberVO memberDetail(String memId);
	int updateDoctor(HashMap<String, Object> map);
}
