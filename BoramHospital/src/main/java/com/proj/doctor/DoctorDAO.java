package com.proj.doctor;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.community.MemberVO;

@Repository
public class DoctorDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public DoctorDTO doctorLogin(HashMap<String, Object> map) {
		return sql.selectOne("doctor.login", map);
	}
	
	public int checkDoctor(String uId) {
		return sql.selectOne("doctor.checkDoctor",uId);
	}
	
	public DoctorDTO selectById(String uId) {
		return sql.selectOne("doctor.selectById",uId);
	}
	
	public DepartmentDTO getDeptName(int deptno) {
		return sql.selectOne("doctor.getDeptName", deptno);
	}
	
	public int delete_doctor(String uId) {
		return sql.delete("doctor.delete_doctor", uId);
	}
	
	public List<ReservationDTO> myReservation(String uId){
		return sql.selectList("doctor.myReservation", uId);
	}
	
	public ReservationDTO reservationDetail(int no) {
		return sql.selectOne("doctor.reservationDetail",no);
	}
	
	public int docCheckUpdate(HashMap<String, Object> map) {
		return sql.update("doctor.docCheckUpdate", map);
	}
	
	public MemberVO memberDetail(String memId) {
		return sql.selectOne("doctor.memberDetail", memId);
	}
	
	public int updateDoctor(HashMap<String, Object> map) {
		return sql.update("doctor.updateDoctor", map);
	}
}
