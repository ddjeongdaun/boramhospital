package com.proj.doctor;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.community.MemberVO;

@Service
public class DoctorServiceImp implements DoctorService{
	
	@Autowired
	private DoctorDAO dao;

	@Override
	public DoctorDTO doctorLogin(HashMap<String, Object> map) {
		return dao.doctorLogin(map);
	}

	@Override
	public int checkDoctor(String uId) {
		return dao.checkDoctor(uId);
	}

	@Override
	public DoctorDTO selectById(String uId) {
		return dao.selectById(uId);
	}

	@Override
	public DepartmentDTO getDeptName(int deptno) {
		return dao.getDeptName(deptno);
	}

	@Override
	public int delete_doctor(String uId) {
		return dao.delete_doctor(uId);
	}

	@Override
	public List<ReservationDTO> myReservation(String uId) {
		return dao.myReservation(uId);
	}

	@Override
	public ReservationDTO reservationDetail(int no) {
		return dao.reservationDetail(no);
	}

	@Override
	public int docCheckUpdate(HashMap<String, Object> map) {
		return dao.docCheckUpdate(map);
	}

	@Override
	public MemberVO memberDetail(String memId) {
		return dao.memberDetail(memId);
	}

	@Override
	public int updateDoctor(HashMap<String, Object> map) {
		return dao.updateDoctor(map);
	}
	
}
