package com.proj.doctor;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.proj.community.MemberVO;

@Controller
public class DoctorController {
	
	@Autowired
	private DoctorServiceImp service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//의료진 로그인 페이지 보여주기
	@RequestMapping("/doctor/login")
	public String login() {
		return "/doctor/login";
	}
	
	//의료진 확인
	public int checkDotor(String uId) {
		return service.checkDoctor(uId);
	}
	
	//로그인 처리
	@RequestMapping("/doctor/loginOk")
	public ModelAndView login(String uId, String uPw, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
	    String encodePw = "";
		
	    //아이디를 통해 멤버 정보 호출
	    DoctorDTO dto=service.selectById(uId);
		
	    String msg="잘못된 로그인 정보입니다.";
		String url="/member/login";
		
		if(dto!=null) {
			rawPw = uPw;				//사용자가 입력한 비밀번호
			encodePw = dto.getuPw();		//데이터베이스의 인코딩 비밀번호 호출
			
			if(pwEncoder.matches(rawPw, encodePw)==true) {	//비밀번호 일치
				dto.setuPw("");			//비밀번호가 동일하니, 보안을위해 비밀번호 삭제
				session.setAttribute("uId_Session", uId);
				msg="로그인되었습니다.";
				url="/";
			}
		}
		
		mav.setViewName("/common/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	//진료내역 페이지
	@RequestMapping(value = "/doctor/reservation")
	public ModelAndView reservation(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		//의료진 체크
		if(uId!=null) {
			int result=checkDotor(uId);
			
			if(result!=1) {		//의료진 아닐 경우
				String msg="의료진만 확인 가능한 페이지입니다.";
				String url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {
				//의료진 메뉴처리
				mav.addObject("gnbParam", false);
				
				//메인내용처리
				List<ReservationDTO> list=service.myReservation(uId);
				
				mav.addObject("list",list);
				mav.setViewName("/doctor/reservation");
			}
		}else {
			String msg="의료진으로 로그인 후 사용가능합니다.";
			String url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}
		
		return mav;
	}
	
	//진료내역 - 진료여부 업데이트
	@RequestMapping(value = "/doctor/docCheckUpdate")
	public ModelAndView reservationDetail(HttpSession session, int no, boolean docCheck) {
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		
		String msg="", url="";
		//의료진 체크
		if(uId!=null) {
			int result=checkDotor(uId);
			
			if(result!=1) {		//의료진 아닐 경우
				msg="의료진만 확인 가능한 페이지입니다.";
				url="/";
			}else {
				//의료진 메뉴처리
				mav.addObject("gnbParam", false);
				
				//메인내용처리
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("no", no);
				map.put("docCheck", docCheck);
				
				int cnt=service.docCheckUpdate(map);
				
					if(cnt>0) {
						msg="진료여부가 수정되었습니다.";
						url="/doctor/reservation";
					}else {
						msg="진료여부 수정 중 에러발생!";
						url="/doctor/reservation";
					}
			}
		}else {
			msg="의료진으로 로그인 후 사용가능합니다.";
			url="/member/login";
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//진료내역 페이지
	@RequestMapping(value = "/doctor/memberDetail")
	public ModelAndView memberDetail(HttpSession session, String memId) {
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		//의료진 체크
		if(uId!=null) {
			int result=checkDotor(uId);
			
			if(result!=1) {		//의료진 아닐 경우
				String msg="의료진만 확인 가능한 페이지입니다.";
				String url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {
				//의료진 메뉴처리
				mav.addObject("gnbParam", false);
				
				//메인내용처리
				MemberVO vo=service.memberDetail(memId);
				
				mav.addObject("vo",vo);
				mav.setViewName("/doctor/memberDetail");
			}
		}else {
			String msg="의료진으로 로그인 후 사용가능합니다.";
			String url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}
		
		return mav;
	}
	
	//비밀번호 확인 페이지 보여주기
	@RequestMapping(value = "/doctor/passwordCheck")
	public ModelAndView passwordCheck(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		String uId=(String)session.getAttribute("uId_Session");
		//메뉴처리
		String gnbParam="";
		if(uId!=null) {
			mav.addObject("gnbParam", false);
		}else {
			mav.addObject("gnbParam", null);
		}
		
		mav.setViewName("/doctor/passwordCheck");
		return mav;
	}
			
	//회원정보수정 페이지 보여주기
	@RequestMapping(value = "/doctor/doctorMod", method = RequestMethod.POST)
	public ModelAndView memberMod(HttpSession session, String uPw) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		//메뉴처리
		String gnbParam="";
		if(uId!=null) {
			mav.addObject("gnbParam", false);
		}else {
			mav.addObject("gnbParam", null);
		}
		
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
		String encodePw = "";
		
		//아이디를 통해 멤버 정보 호출
		DoctorDTO dto=service.selectById(uId);
		
		String msg="로그인 후 사용가능합니다.";
		String url="/member/login";
		
		//회원정보가 있을 시,
		if(dto!=null) {
			rawPw = uPw;			//사용자가 입력한 비밀번호
			encodePw = dto.getuPw();	//데이터베이스의 인코딩 비밀번호 호출
				
			//비밀번호 일치
			if(pwEncoder.matches(rawPw, encodePw)==true) {
				dto.setuPw("");			//비밀번호가 동일하니, 보안을위해 비밀번호 삭제
				//이메일 처리
				String uEmail=dto.getuEmail();
				String email[] = uEmail.split("@");
				String email1=email[0];
				String email2=email[1];
				String email3="";
				
				String emailList[] = {"naver.com","daum.net"};
				if(!email2.equals(emailList[0]) || !email2.equals(emailList[1])) {
					email3=email2;
				}
				mav.addObject("email1",email1);
				mav.addObject("email2",email2);
				mav.addObject("email3",email3);
				
				//진료과 처리
				int deptno=dto.getDeptno();
				DepartmentDTO deptDTO=service.getDeptName(deptno);
				
				String deptName=deptDTO.getDeptName();
				
				mav.addObject("deptName",deptName);
				mav.addObject("dto", dto);
				mav.addObject("uId",uId);
				mav.setViewName("doctor/doctorMod");
			}else {
				msg="잘못된 비밀번호입니다.";
				url="/doctor/passwordCheck";
				mav.setViewName("/common/message");
				mav.addObject("msg",msg);
				mav.addObject("url", url);
			}
		}else {
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.setViewName("/common/message");
		}
		
		return mav;
	}
	
	//회원수정 모드 페이지
	@RequestMapping(value = "/doctor/doctorMod")
	public ModelAndView memberMod(HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		//메뉴처리
		String gnbParam="";
		if(uId!=null) {
			mav.addObject("gnbParam", true);
		}else {
			mav.addObject("gnbParam", null);
		}
		
		//로그인 체크
		if(uId==null) {
			String msg="로그인 후 사용가능합니다.";
			String url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			DoctorDTO dto=service.selectById(uId);
			
			String uEmail=dto.getuEmail();
			
			String email[] = uEmail.split("@");
			String email1=email[0];
			String email2=email[1];
			String email3="";
			
			String emailList[] = {"naver.com","daum.net"};
			
			if(!email2.equals(emailList[0]) || !email2.equals(emailList[1])) {
				email3=email2;
			}
			//이메일처리
			mav.addObject("email1",email1);
			mav.addObject("email2",email2);
			mav.addObject("email3",email3);
			
			mav.addObject("dto", dto);
			mav.addObject("uId",uId);
			mav.setViewName("doctor/doctorMod");
		}
		
		return mav;
	}
	
	//회원탈퇴 페이지
	@RequestMapping(value = "/doctor/memberQuit")
	public String memberQuit() {
		return "doctor/memberQuit";
	}
	
	//회원탈퇴 처리
	@RequestMapping(value = "/doctor/memberQuitProc")
	public ModelAndView memberQuitProc(HttpSession session) {
		
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="로그인 후 탈퇴가 가능합니다.";
			url="/doctor/login";
		}else {
			int cnt=service.delete_doctor(uId);
				if(cnt>0) {
					session.removeAttribute("uId_Session");
					msg="회원탈퇴가 완료되었습니다.";
					url="/";
				}else {
					msg="회원탈퇴 중 오류가 발생하였습니다.";
					url="/doctor/memberQuit";
				}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//회원정보 수정 처리
	@RequestMapping(value = "/doctor/doctorModOK")
	public ModelAndView doctorModOK(HttpSession session, String uPw, String uName, String uEmail) {
		
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="로그인 후 탈퇴가 가능합니다.";
			url="/doctor/login";
		}else {
			//수정처리
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("uEmail",uEmail);
			map.put("uName",uName);
			map.put("uPw",uPw);
			map.put("uId",uId);
			
			int cnt=service.updateDoctor(map);
			if(cnt>0) {
				msg="회원수정이 완료되었습니다.";
			}else {
				msg="회원수정 중 오류가 발생하였습니다.";
			}
			url="/doctor/doctorMod";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
}
