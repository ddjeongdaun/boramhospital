package com.proj.admin;

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

import com.proj.board.Criteria;
import com.proj.board.PageMaker;
import com.proj.community.MemberVO;
import com.proj.doctor.DepartmentDTO;
import com.proj.doctor.DoctorDTO;
import com.proj.doctor.ReservationDTO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImp service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//로그인 및 관리자 확인
	public int checkAdmin(String uId) {
		return service.checkAdmin(uId);
	}
	
	//관리자 메인 페이지 표시 + 관리자 확인
	@RequestMapping(value = "/adminMain")
	public ModelAndView adminMain(HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav= new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
				
			//멤버가 아닐 때
			int isMember=service.checkMember(uId);
			if(isMember==0) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else if(checkAdmin(uId)==1) {
				mav.addObject("adminCheck", true);
				mav.setViewName("/admin/adminMain");
			}else {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}
		}
		
		return mav;
	}
	
	//회원관리 페이지 표시
	@RequestMapping(value = "/manageMember")
	public ModelAndView manageMember(HttpSession session, Criteria cri) {
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {
				//실제 작업 처리 구간
				
				//total회원 수
				int total=service.countMember();
				
				//페이지 설정
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("pageStart", cri.getPageStart());
				map.put("perPageNum", cri.getPerPageNum());
				
				//페이징
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(total);
				List<MemberVO> list = service.allMember(map);
				
				mav.addObject("list",list);
				mav.addObject("pageMaker", pageMaker);
				
				mav.setViewName("/admin/manageMember");
				mav.addObject("adminCheck", true);
			}
			
		}
		
		return mav;
	}
	
	//의료진 관리 페이지 표시
	@RequestMapping(value = "/manageDoctor")
	public ModelAndView manageDoctor(HttpSession session, Criteria cri) {
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {
				//실제 작업 처리
				
				//총 의료진 수
				int total=service.countDoctor();
				
				//페이지 설정
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("pageStart", cri.getPageStart());
				map.put("perPageNum", cri.getPerPageNum());
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(total);
				
				List<DoctorDTO> list = service.allDoctor(map);
				
				mav.addObject("list",list);
				mav.addObject("pageMaker", pageMaker);
				
				mav.setViewName("/admin/manageDoctor");
				mav.addObject("adminCheck", true);
			}
		}
		
		return mav;
	}
	
	//의료진 계정 생성 페이지 보여주기
	@RequestMapping(value = "/insertDoctor")
	public ModelAndView insertDoctor(HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//실제 작업 처리
				mav.setViewName("admin/insertDoctor");
			}
		}
		
		return mav;
	}
	
	//의료진 계정 생성 처리
	@RequestMapping(value = "/insertDoctorProc", method = RequestMethod.POST)
	public ModelAndView insertDoctorProc(HttpSession session, @ModelAttribute DoctorDTO dto, String uEmail_01, String uEmail_02) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//실제 작업 처리
				
				String rawPwd ="1234";		//인코딩 전 비밀번호
				String encodePwd = pwEncoder.encode(rawPwd);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("uId",dto.getuId());
				map.put("uName",dto.getuName());
				map.put("position",dto.getPosition());
				map.put("deptno",dto.getDeptno());
				map.put("uPw",encodePwd);
				String uEmail=uEmail_01+"@"+uEmail_02;
				map.put("uEmail", uEmail);
				
				int result=service.insertDoctor(map);
				
				if(result>0) {
					msg="의료진 계정이 생성되었습니다.";
					url="/admin/manageDoctor";
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					mav.setViewName("/common/message");
				}else {
					msg="계정 생성 중 에러발생!";
					url="/admin/insertDoctor";
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					mav.setViewName("/common/message");
				}
			}
		}
		
		return mav;
	}
	
	//진료예약 디테일 페이지 보여주기
	@RequestMapping(value = "/reservationDetail")
	public ModelAndView reservationDetail(HttpSession session, String no) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//실제 작업 처리
				ReservationDTO dto=service.reservationByNo(no);
				
				mav.addObject("dto",dto);
				mav.setViewName("admin/reservationDetail");
			}
		}
		
		return mav;
	}
	
	//진료예약 삭제
	@RequestMapping(value = "/deleteReservation")
	public ModelAndView deleteReservation(HttpSession session, String no) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
			}else {								//관리자일경우
				//실제 작업 처리
				int result=service.deleteReservation(no);
				if(result>0) {
					msg="진료내역이 삭제되었습니다.";
					url="/admin/manageReservation";
				}else {
					msg="진료삭제 중 에러발생!";
					url="/admin/manageReservation";
				}
			}
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//회원 디테일 페이지 표시
	@RequestMapping(value = "/memberDetail")
	public ModelAndView memberDetail(@RequestParam(defaultValue = "0") int num, HttpSession session) {
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//실제 작업 처리
				MemberVO vo=service.detailMember(num);
				
				mav.addObject("vo", vo);
				mav.setViewName("admin/memberDetail");
			}
		}
		
		return mav;
	}
	
	//회원 비밀번호 초기화
	@RequestMapping(value = "/resetPw")
	public ModelAndView resetPw(@RequestParam String uId, int num) {
		ModelAndView mav = new ModelAndView();
		
		//비밀번호 초기화 처리
		String rawPwd ="1234";		//인코딩 전 비밀번호
		String encodePwd = pwEncoder.encode(rawPwd);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("uPw", encodePwd);
		int cnt=service.resetPw(map);
		
		String msg="비밀번호가 초기화 되었습니다.", url="/admin/manageMember";
		if(cnt!=1) {
			msg="비밀번호 초기화 중 에러가 발생하였습니다.";
			url="/admin/memberDetail?num="+num;
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//의료진 비밀번호 초기화
	@RequestMapping(value = "/resetDoctorPw")
	public ModelAndView resetDoctorPw(@RequestParam(defaultValue = "0") int num) {
		ModelAndView mav = new ModelAndView();
		
		//비밀번호 초기화 처리
		String rawPwd ="1234";
		String encodePwd = pwEncoder.encode(rawPwd);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("uPw", encodePwd);
		
		//비밀번호 초기화 처리
		int cnt=service.resetDoctorPw(map);
		
		String msg="비밀번호가 초기화 되었습니다.", url="/admin/manageDoctor";
		if(cnt!=1) {
			msg="비밀번호 초기화 중 에러가 발생하였습니다.";
			url="/admin/doctorDetail?num="+num;
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//의료진 아이디 중복확인
	@RequestMapping(value = "/idCheck")
	public String idCheck(@RequestParam String uId, Model model) {
		DoctorDTO dto = service.doctorIdCheck(uId);
		
		if(dto==null) {
			model.addAttribute("check", true);	//아이디 중복X
			model.addAttribute("msg"," 는 사용가능한 ID입니다.");
			model.addAttribute("btnCap", "사용하기");
		}else {
			model.addAttribute("check", false);	//아이디 중복됨
			model.addAttribute("msg", " 는 중복된 ID 입니다.");
			model.addAttribute("btnCap", "ID 재입력");
		}
		model.addAttribute("uId", uId);
		
		return "admin/idCheck";
	}
	
	//진료과 번호 중복확인
	@RequestMapping(value = "/deptnoCheck")
	public ModelAndView deptnoCheck(@RequestParam int deptno, Model model, HttpSession session) {
		
		String uId=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//실제 작업 처리
				DepartmentDTO dto=service.deptnoCheck(deptno);
				if(dto==null) {
					mav.addObject("check", true);	//중복X
					mav.addObject("msg", " 는 사용가능한 번호입니다.");
					mav.addObject("btnCap", "사용하기");
				}else {
					mav.addObject("check", false);	//중복
					mav.addObject("msg", " 는 중복된 번호 입니다.");
					mav.addObject("btnCap", "재입력");
				}
				mav.addObject("deptno", deptno);
			}
		}

		return mav;
	}
	
	//의료진 디테일 페이지 보여주기
	@RequestMapping(value = "/doctorDetail")
	public ModelAndView doctorDetail(int num) {
		ModelAndView mav = new ModelAndView();
		DoctorDTO dto=service.detailDoctor(num);
		
		mav.addObject("dto", dto);
		mav.setViewName("admin/doctorDetail");
		return mav;
	}
	
	//진료내역 페이지 표시
	@RequestMapping(value = "/manageReservation")
	public ModelAndView manageReservation(HttpSession session, Criteria cri){
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//실제 작업 처리
				//전체 진료예약 수
				int total=service.countReservation();
				
				//페이지 설정
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("pageStart", cri.getPageStart());
				map.put("perPageNum", cri.getPerPageNum());
				
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(total);
				
				List<ReservationDTO> list=service.allReservation(map);
				
				mav.addObject("list",list);
				mav.addObject("pageMaker",pageMaker);
				mav.setViewName("/admin/manageReservation");
				mav.addObject("adminCheck", true);
			}
		}
		
		return mav;
	}
	
	//진료과관리 페이지 표시
	@RequestMapping(value = "/manageDepartment")
	public ModelAndView manageDepartment(HttpSession session, Criteria cri){
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//실제 작업 처리
				//전체 진료예약 수
				List<DepartmentDTO> list=service.allDepartment();
				
				mav.addObject("list",list);
				mav.setViewName("/admin/manageDepartment");
				mav.addObject("adminCheck", true);
			}
		}
		
		return mav;
	}

	//회원 삭제
	@RequestMapping(value = "/deleteMember")
	public ModelAndView deleteMember(HttpSession session, String uId) {
		ModelAndView mav = new ModelAndView();
		
		String uId_Session=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId_Session==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId_Session);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//관리자 메뉴처리
				mav.addObject("adminCheck", true);
				//실제 작업 처리
				int result=service.deleteMember(uId);
				
				msg="회원 삭제 중 에러 발생!";
				url="/admin/manageMember";
				if(result>0) {
					msg="회원이 삭제되었습니다.";
				}
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}
		}
		return mav;
	}
	
	//의료진 삭제
	@RequestMapping(value = "/deleteDoctor")
	public ModelAndView deleteDoctor(String uId, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String uId_Session=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId_Session==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId_Session);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//관리자 메뉴처리
				mav.addObject("adminCheck", true);
				//실제 작업 처리
				msg="의료진 삭제 중 에러 발생!";
				url="/admin/manageDoctor";
				
				int result=service.deleteDoctor(uId);
				
				if(result>0) {
					msg="의료진 회원이 삭제되었습니다.";
				}
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}
		}
		return mav;
	}
	
	//진료과 등록 페이지 표시
	@RequestMapping(value = "/insertDepartment")
	public ModelAndView insertDepartment(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("/common/message");
			}else {								//관리자일경우
				//관리자 메뉴처리
				mav.addObject("adminCheck", true);
				//실제 작업 처리
				List<DepartmentDTO> list=service.allDepartment();
				mav.addObject("list",list);
				mav.setViewName("admin/insertDepartment");
			}
		}
		
		return mav;
	}
	
	//진료과 등록
	@RequestMapping(value = "/insertDeptProc", method = RequestMethod.POST)
	public ModelAndView insertDeptProc(HttpSession session, DepartmentDTO dto){
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
			}else {								//관리자일경우
				//관리자 메뉴처리
				mav.addObject("adminCheck", true);
				//실제 작업 처리
				int result=service.insertDept(dto);
				if(result>0) {
					msg="진료과가 등록되었습니다.";
					url="/admin/manageDepartment";
				}else {
					msg="진료과 등록 중 에러발생!";
					url="redirect:/admin/insertDepartment";
				}
			}
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//진료과 삭제
	@RequestMapping(value = "/deleteDepartment")
	public ModelAndView deleteDepartment(HttpSession session, String deptno){
		ModelAndView mav = new ModelAndView();
		String uId=(String)session.getAttribute("uId_Session");
		
		String msg="", url="";
		if(uId==null) {
			msg="관리자로 로그인 후 접속가능합니다.";
			url="/member/login";
		}else {
			int cnt =checkAdmin(uId);
			if(cnt!=1) {
				msg="관리자만 접속가능한 페이지입니다.";
				url="/";
			}else {								//관리자일경우
				mav.addObject("adminCheck", true);
				//실제 작업 처리
				int chk=service.checkDept(deptno);
				
				if(chk>0) {
					msg="사용중인 진료과는 삭제할 수 없습니다.";
					url="/admin/manageDepartment";
				}else {
					int result=service.deleteDepartment(deptno);
					if(result>0) {
						msg="진료과가 삭제되었습니다.";
						url="/admin/manageDepartment";
					}else {
						msg="진료과 삭제 중 에러가 발생하였습니다.";
						url="/admin/manageDepartment";
					}
				}
				
			}
		}
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
}
