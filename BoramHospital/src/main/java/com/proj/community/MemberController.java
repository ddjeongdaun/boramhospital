package com.proj.community;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.admin.AdminServiceImp;
import com.proj.doctor.DoctorDTO;
import com.proj.doctor.DoctorServiceImp;
import com.proj.doctor.ReservationDTO;


@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImp service;
	
	@Autowired
	DoctorServiceImp doctorService;
	
	@Autowired
	AdminServiceImp adminService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//메인 페이지
	@RequestMapping(value = "/")
	public ModelAndView index(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		String uId_Session=(String)session.getAttribute("uId_Session");
		mav.addObject("uId_Session", uId_Session);
		
		mav.setViewName("/index");
		return mav;
	}
	
	//회원가입 약관 페이지
	@RequestMapping(value = "/member/joinAgreement")
	public ModelAndView joinAgreement() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/member/joinAgreement");
		return mav;
	}
	
	//회원가입 페이지
	@RequestMapping(value = "/member/member")
	public ModelAndView member() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/member/member");
		return mav;
	}
	
	//로그인 화면
	@RequestMapping(value = "/member/login")
	public ModelAndView login_get() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/member/login");
		return mav;
	}
	
	//로그인
	@RequestMapping(value = "/login")
	public ModelAndView login(String uId, String uPw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
	    String encodePw = "";
		
	    //아이디를 통해 멤버 정보 호출
		MemberVO vo=service.member_select(uId);
		
		String msg="잘못된 로그인 정보입니다.";
		String url="/member/login";
		
		if(vo!=null) {
			rawPw = uPw;				//사용자가 입력한 비밀번호
			encodePw = vo.getuPw();		//데이터베이스의 인코딩 비밀번호 호출
			
			if(pwEncoder.matches(rawPw, encodePw)==true) {	//비밀번호 일치
				vo.setuPw("");			//비밀번호가 동일하니, 보안을위해 비밀번호 삭제
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
	
	//로그아웃
	@RequestMapping(value = "/member/logout")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="로그아웃 되었습니다.";
		String url="/";
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		return mav;
	}
	
	//회원가입 처리
	@RequestMapping(value="/member/memberProc")
	public ModelAndView memberProc(@ModelAttribute MemberVO memberVO) {
		
		String rawPwd = memberVO.getuPw();				//인코딩 전 비밀번호
		String encodePwd = pwEncoder.encode(rawPwd);	//비밀번호 인코딩
		
		memberVO.setuPw(encodePwd);						//인코딩한 비밀번호를 멤버에 저장
		
		int result=service.member_insert(memberVO);
		
		String msg="회원가입 중 문제가 발생했습니다. 다시 시도해주세요."
				+ "\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.",
				url="/member/member";
		
		if(result==1) {
			msg="회원가입이 완료되었습니다.";
			url="/";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//회원탈퇴 페이지
	@RequestMapping(value="/member/memberQuit")
	public ModelAndView memberQuit(HttpSession session) {
		
		String uId=(String)session.getAttribute("uId_Session");
		
		ModelAndView mav = new ModelAndView();
		String msg="", url="";
		
		if(uId!=null) {
			mav.setViewName("/member/memberQuit");
		}else {
			msg="로그인 후 회원탈퇴가 가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}
		
		return mav;
	}
	
	//회원탈퇴 처리
	@RequestMapping(value="/memberQuitProc")
	public ModelAndView memberQuitProc(HttpSession session) {
		
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		
		if(uId==null) {
			msg="로그인 후 회원탈퇴가 가능합니다.";
			url="/member/login";
		}else {
			int cnt=service.member_delete(uId);
			if(cnt>0) {
				//세션삭제
				session.removeAttribute("uId_Session");
				
				msg="회원 탈퇴 완료!";
				url="/";
			}else {
				msg="회원 탈퇴 처리 중 에러 발생!";
				url="/member/memberQuit";
			}
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		return mav;
	}
	
	//아이디 중복확인 페이지
	@RequestMapping(value = "/member/idCheck")
	public String idCheck(@RequestParam String uId, Model model) {
		MemberVO vo=service.member_id_check(uId);
		
		if(vo==null) {
			model.addAttribute("check", true);	//아이디 중복X
			model.addAttribute("msg"," 는 사용가능한 ID입니다.");
			model.addAttribute("btnCap", "사용하기");
		}else {
			model.addAttribute("check", false);	//아이디 중복됨
			model.addAttribute("msg", " 는 중복된 ID 입니다.");
			model.addAttribute("btnCap", "ID 재입력");
		}
		model.addAttribute("uId", uId);
		
		return "member/idCheck";
	}
	
	//iframe1
	@RequestMapping(value = "/ind/personalInfoAgree")
	public ModelAndView iframe1() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/ind/personalInfoAgree");
		
		return mav;
	}
	//iframe2
	@RequestMapping(value = "/ind/usingAgree")
	public ModelAndView iframe2() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/ind/usingAgree");
		
		return mav;
	}
	//iframe3
	@RequestMapping(value = "/ind/shopInfoAgree")
	public ModelAndView iframe3() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/ind/shopInfoAgree");
		
		return mav;
	}
	
	//마이페이지 보여주기
	@RequestMapping(value = "member/myPage")
	public ModelAndView myPage(HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		String gnbParam="";
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo=service.member_select(uId);
		int cnt=doctorService.checkDoctor(uId);
		
		if(vo!=null) {
			mav.addObject("gnbParam", true);
		}else if(cnt>0) {
			mav.addObject("gnbParam", false);
		}else {
			mav.addObject("gnbParam", null);
		}
		mav.setViewName("member/myPage");
		
		return mav;
	}
	
	//비밀번호 확인 페이지 보여주기
	@RequestMapping(value = "/member/passwordCheck")
	public ModelAndView passwordCheck(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		String uId=(String)session.getAttribute("uId_Session");
		//메뉴처리
		String gnbParam="";
		if(uId!=null) {
			mav.addObject("gnbParam", true);
		}else {
			mav.addObject("gnbParam", null);
		}
		
		mav.setViewName("/member/passwordCheck");
		return mav;
	}
	
	//회원정보수정 전 비밀번호 확인 페이지
	@RequestMapping(value = "/member/memberMod", method = RequestMethod.POST)
	public ModelAndView memberMod(HttpSession session, String uPw) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		//메뉴처리
		String gnbParam="";
		if(uId!=null) {
			mav.addObject("gnbParam", true);
		}else {
			mav.addObject("gnbParam", null);
		}
		
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
		String encodePw = "";
		
		//아이디를 통해 멤버 정보 호출
		MemberVO vo=service.member_select(uId);
		
		String msg="로그인 후 사용가능합니다.";
		String url="/member/login";
		
		//회원정보가 있을 시,
		if(vo!=null) {
			rawPw = uPw;			//사용자가 입력한 비밀번호
			encodePw = vo.getuPw();	//데이터베이스의 인코딩 비밀번호 호출
				
			//비밀번호 일치
			if(pwEncoder.matches(rawPw, encodePw)==true) {
				vo.setuPw("");			//비밀번호가 동일하니, 보안을위해 비밀번호 삭제
				
				//회원 정보전달
				String uEmail=vo.getuEmail();
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
				
				//성별
				String gender=vo.getGender();
				mav.addObject("gender",gender);
				
				//생년월일
				String uBirthday=vo.getuBirthday();
				mav.addObject("uBirthday",uBirthday);
				
				//주소
				String uAddr=vo.getuAddr();
				String uZipcode=vo.getuZipcode();
				
				//취미
				if(vo.getuHobby() != null) {
					String hobbyList[] = vo.getuHobby().split(",");
					mav.addObject("hobbyList", hobbyList);
				}else {
					mav.addObject("hobbyList", null);
				}
				
				mav.addObject("uAddr", uAddr);
				mav.addObject("uZipcode", uZipcode);
				
				mav.addObject("vo", vo);
				mav.addObject("uId",uId);
				mav.setViewName("member/memberMod");
			}else {
				msg="잘못된 비밀번호 입니다";
				url="/member/passwordCheck";
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
	
	//회원정보 수정 페이지 호출
	@RequestMapping(value = "/member/memberMod")
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
			MemberVO vo=service.member_select(uId);
			
			String uEmail=vo.getuEmail();
			
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
			
			//성별
			String gender=vo.getGender();
			mav.addObject("gender",gender);
			
			//생년월일
			String uBirthday=vo.getuBirthday();
			mav.addObject("uBirthday",uBirthday);
			
			//주소
			String uAddr=vo.getuAddr();
			String uZipcode=vo.getuZipcode();
			
			//취미
			if(vo.getuHobby() != null) {
				String hobbyList[] = vo.getuHobby().split(",");
				mav.addObject("hobbyList", hobbyList);
			}else {
				mav.addObject("hobbyList", null);
			}
			
			mav.addObject("uAddr", uAddr);
			mav.addObject("uZipcode", uZipcode);
			
			mav.addObject("vo", vo);
			mav.addObject("uId",uId);
			mav.setViewName("member/memberMod");
		}
		
		return mav;
	}
	
	//회원정보 수정처리
	@RequestMapping(value = "/member/memberModProc", method = RequestMethod.POST)
	public ModelAndView memberModProc(@ModelAttribute MemberVO memberVO, HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		memberVO.setuId(uId);
		
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="로그인 후 사용가능합니다.";
			url="/member/login";
		}else {
			String rawPwd ="";		//인코딩 전 비밀번호
			String encodePwd = "";	//인코딩 후 비밀번호
			
			rawPwd = memberVO.getuPw();
			encodePwd = pwEncoder.encode(rawPwd);	//비밀번호 인코딩
			memberVO.setuPw(encodePwd);				//인코딩한 비밀번호를 멤버vo에 저장
			
			int cnt=service.updateMember(memberVO);
			if(cnt>0) {
				msg="회원정보 수정이 완료되었습니다.";
				url="/member/memberMod";
			}else {
				msg="회원정보 수정 중 에러발생!";
				url="/member/memberMod";
			}
		}
		
		mav.addObject("uId",uId);
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//우편번호 창띄우기
	@RequestMapping(value = "/member/zipCheck")
	public String zipCheck() {
		return "member/zipCheck";
	}
	
	//우편번호 찾기
	@RequestMapping(value = "/zipCheckSearch")
	public ModelAndView zipCheckSearch(@RequestParam String area3) {
		ModelAndView mav = new ModelAndView();
		
		List<ZipcodeVO> list=service.selectZipcode(area3);
		
		mav.addObject("area3", area3);
		mav.addObject("list", list);
		
		mav.setViewName("member/zipCheck");
		return mav;
	}
	
	//진료예약하기 페이지
	@RequestMapping(value = "member/reservation")
	public ModelAndView reservation(HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		String gnbParam="";
		
		ModelAndView mav = new ModelAndView();
		MemberVO vo=service.member_select(uId);
		
		if(uId==null) {
			String msg="로그인 후 진료예약이 가능합니다";
			String url="/member/login";
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt=doctorService.checkDoctor(uId);
			int cnt2=adminService.checkAdmin(uId);
			
			if(cnt==1 || cnt2==1) {		//의료진,관리자인 경우
				String msg="일반회원으로 로그인 후 진료예약이 가능합니다.";
				String url="/";
				
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else if(vo!=null) {		//회원인 경우
				//실제 작업 처리
				mav.addObject("gnbParam", true);
				mav.addObject("vo", vo);
				mav.setViewName("member/reservation");
			}
		}
		
		return mav;
	}
	
	//예약리스트 보여주기
	@RequestMapping(value = "/member/reservationList")
	public ModelAndView reservationList(HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		MemberVO vo=service.member_select(uId);
		
		if(uId==null) {
			String msg="로그인 후 예약내역 확인이 가능합니다";
			String url="/member/login";
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt=doctorService.checkDoctor(uId);
			int cnt2=adminService.checkAdmin(uId);
			
			if(cnt==1 || cnt2==1) {		//의료진,관리자인 경우
				String msg="일반회원으로 로그인 후 진료예약이 가능합니다.";
				String url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
				
			}else if(vo!=null) {		//회원인 경우
				//실제 작업 처리
				mav.addObject("gnbParam", true);
				
				List<ReservationDTO> list=service.reservationList(uId);
				
				mav.addObject("vo", vo);
				mav.addObject("list", list);
				mav.setViewName("member/reservationList");
			}
		}
		
		return mav;
	}
	
	//예약내역 삭제
	@RequestMapping(value = "/member/deleteReservation")
	public ModelAndView deleteReservation(HttpSession session, int no) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		MemberVO vo=service.member_select(uId);
		
		String msg="", url="";
		if(uId==null) {
			msg="로그인 후 예약내역 삭제가 가능합니다";
			url="/member/login";
		}else {
			int cnt=doctorService.checkDoctor(uId);
			int cnt2=adminService.checkAdmin(uId);
			
			if(cnt==1 || cnt2==1) {		//의료진,관리자인 경우
				msg="일반회원으로 로그인 후 사용가능한 메뉴입니다.";
				url="/";
				
			}else if(vo!=null) {		//회원인 경우
				mav.addObject("gnbParam", true);
				//실제 작업 처리
				int result=service.deleteReservation(no);
				if(result>0) {
					msg="예약이 삭제되었습니다.";
					url="/member/reservationList";
				}else {
					msg="예약 삭제 중 에러 발생!";
					url="/member/reservationList";
				}
			}
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//진료예약 다음
	@RequestMapping(value = "/member/reservationNext")
	public ModelAndView reservationNext(HttpSession session, String deptno){
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		MemberVO vo=service.member_select(uId);
		
		String msg="", url="";
		if(uId==null) {
			msg="로그인 후 진료예약이 가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt=doctorService.checkDoctor(uId);
			int cnt2=adminService.checkAdmin(uId);
			
			if(cnt==1 || cnt2==1) {		//의료진,관리자인 경우
				msg="일반회원으로 로그인 후 진료예약이 가능합니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
				
			}else if(vo!=null) {		//회원인 경우
				mav.addObject("gnbParam", true);
				//실제 작업 처리
				//진료과 별 의사 찾기
				List<DoctorDTO> list=service.doctorByDeptno(deptno);
				
				mav.addObject("list", list);
				mav.setViewName("/member/reservation2");
				mav.addObject("listResult", true);
				
				if(list==null || list.isEmpty()) {
					mav.addObject("listResult", false);
				}
			}
		}
		return mav;
	}
	
	//진료예약 처리
	@RequestMapping(value = "/member/reservationProc")
	public ModelAndView reservationProc(HttpSession session, ReservationDTO dto) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		MemberVO vo=service.member_select(uId);
		
		String msg="", url="";
		if(uId==null) {
			msg="로그인 후 진료예약이 가능합니다.";
			url="/member/login";
		}else {
			int cnt=doctorService.checkDoctor(uId);
			int cnt2=adminService.checkAdmin(uId);
			
			if(cnt==1 || cnt2==1) {		//의료진,관리자인 경우
				msg="일반회원으로 로그인 후 진료예약이 가능합니다.";
				url="/";
				
			}else if(vo!=null) {		//회원인 경우
				mav.addObject("gnbParam", true);
				//실제 작업 처리
				
				HashMap<String, Object> map2 = new HashMap<String, Object>();
				map2.put("memId", uId);
				map2.put("docId", dto.getDocId());
				map2.put("reservation", dto.getReservation());
				
				int result=service.reservation(map2);
				if(result>0) {
					msg="진료예약 되었습니다.";
					url="/member/reservationList";
				}else {
					msg="진료예약 중 에러 발생!";
					url="/member/reservation";
				}
			}
			
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
			return mav;
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
}
