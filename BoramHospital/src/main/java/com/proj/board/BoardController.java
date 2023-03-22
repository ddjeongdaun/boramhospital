package com.proj.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.proj.admin.AdminServiceImp;
import com.proj.community.MemberServiceImp;
import com.proj.community.MemberVO;
import com.proj.doctor.DoctorDTO;
import com.proj.doctor.DoctorServiceImp;


@Controller
public class BoardController {

	private static final Logger logger
	= LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardServiceImp service;

	@Autowired
	MemberServiceImp memberService;

	@Autowired
	AdminServiceImp adminService;
	
	@Autowired
	DoctorServiceImp docService;
	
	//로그인 체크
	public boolean loginCheck(String uId) {
		boolean result=true;
		if(uId==null) {
			result=false;
		}
		return result;
	}

	//게시물 페이징
	@RequestMapping(value="/bbs/list")
	public ModelAndView list(HttpSession session, @RequestParam(required = false) String keyWord, 
			@RequestParam(required = false) String keyField, Criteria cri, String page) {
		ModelAndView mav = new ModelAndView("/bbs/list");
		
		//검색어 처리
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());

		//총 게시글 수
		int total=service.totalBoard(map);
		
		//페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(total);
		List<Map<String,Object>> list = service.selectBoardList(map);

		//검색필드와 검색어
		pageMaker.setSearchKeyfieldKeyword(keyField,keyWord);
		
		//메뉴처리
		mav.addObject("boardParam", true);
		
		mav.addObject("list", list);
		mav.addObject("keyField", keyField);
		mav.addObject("keyWord", keyWord);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("page", page);

		//글쓰기-로그인확인
		String uId=(String)session.getAttribute("uId_Session");
		if(uId!=null) {
			mav.addObject("sessionResult", true);
		}else {
			mav.addObject("sessionResult", false);
		}

		return mav;
	}

	//게시판 상세보기 화면
	@RequestMapping(value = "/bbs/read")
	public ModelAndView modify(@RequestParam(defaultValue = "0") String num, HttpSession session,
								@RequestParam(required = false) String keyWord, 
								@RequestParam(required = false) String keyField, String page) {
		ModelAndView mav = new ModelAndView();
		//조회수 증가
		int cnt=service.updateReadCnt(num);
		logger.info("조회수 증가, 파라미터 num={}",num);

		//로그인 여부 / 게시글 작성자 확인
		String uId_Session=(String)session.getAttribute("uId_Session");

		//메뉴처리
		mav.addObject("boardParam", true);
		
		BoardDTO dto=service.selectBoard(num);
		mav.addObject("dto", dto);
		mav.setViewName("/bbs/read");

		boolean result=false;
		boolean adminResult=false;
		
		if(uId_Session!=null) {
			if(dto.getuId().equals(uId_Session)) {
				result=true;
			}else if(adminService.checkAdmin(uId_Session)==1) {
				adminResult=true;
			}
		}
		mav.addObject("uId_result", result);
		mav.addObject("adminResult", adminResult);
		mav.addObject("keyWord", keyWord);
		mav.addObject("keyField", keyField);
		mav.addObject("page", page);
		
		return mav;
	}

	//게시판 글쓰기 화면보기
	@RequestMapping(value = "/bbs/write")
	public ModelAndView write(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String uId=(String)session.getAttribute("uId_Session");
		String msg="", url="";

		if(uId==null) {								//비회원
			msg="로그인 후 글쓰기가 가능합니다.";
			url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else if(docService.checkDoctor(uId)==1) {	//의사 로그인
			msg="일반 회원으로 로그인 후 글쓰기가 가능합니다.";
			url="/bbs/list";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {										//회원 및 관리자 로그인
			MemberVO vo=memberService.member_select(uId);
			mav.addObject("vo", vo);
			mav.setViewName("/bbs/write");
		}

		return mav;
	}

	//파일업로드 페이지(test용)
	@RequestMapping(value = "/bbs/uploadForm")
	public String upload() {
		return "/bbs/uploadForm";
	}

	//파일업로드(test용)
	@RequestMapping(value = "/bbs/uploadFormAction")
	public ModelAndView uploadFormAction(MultipartFile[] uploadFile) {

		String uploadFolder="D:/openAPI/silsp/spring_Legacy/comm2/src/main/resources/fileUpload";

		for(MultipartFile multipartFile : uploadFile) {
			logger.info("----------");
			logger.info("업로드 파일 명 : "+multipartFile.getOriginalFilename());
			logger.info("업로드 파일 사이즈 : "+multipartFile.getSize());

			File saveFile = new File(uploadFolder,multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
		}

		String msg="저장완료", url="/bbs/list";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");

		return mav;
	}

	String uploadFolder="D:/openAPI/silsp/spring_Legacy/comm2/src/main/resources/fileUpload";

	//글쓰기(insert) + 파일업로드
	@RequestMapping(value = "/bbs/writeFrm")
	public ModelAndView writeFrm(HttpSession session, BoardDTO vo, MultipartFile[] uploadFile) {
		//파일업로드
		for(MultipartFile multipartFile : uploadFile) {
			logger.info("----------");
			logger.info("업로드 파일 명 : "+multipartFile.getOriginalFilename());
			logger.info("업로드 파일 사이즈 : "+multipartFile.getSize());
			String fileName=multipartFile.getOriginalFilename();
			int fileSize=(int)multipartFile.getSize();
			vo.setFileName(fileName);
			vo.setFileSize(fileSize);

			File saveFile = new File(uploadFolder,multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
		}
		
		ModelAndView mav = new ModelAndView();

		String uId=(String)session.getAttribute("uId_Session");
		String msg="", url="";
		if(uId==null) {
			msg="로그인 후 게시글 등록이 가능합니다.";
			url="/member/login";
		}else {
			vo.setuId(uId);

			int maxNum=service.maxNum();
			vo.setRef(maxNum+1);

			int cnt=service.write(vo);
			if(cnt>0) {
				msg="게시물 등록완료!";
				url="/bbs/list";
			}else {
				msg="게시물 등록 중 에러가 발생하였습니다.";
				url="/bbs/write";
			}
		}

		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");

		return mav;
	}
	
	//파일 다운로드
	@RequestMapping("/resources/download")
	public ModelAndView download(@RequestParam String fileName) {
		String path = uploadFolder+"/"+fileName;
		File file = new File(path);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("downloadFile", file);
		mav.setViewName("downloadView");
		return mav;
	}
 

	//조회수 증가
	@RequestMapping(value = "/bbs/updateReadCnt")
	public void updateReadCnt(@RequestParam String num) {
		int cnt=service.updateReadCnt(num);
		logger.info("조회수 증가, 파라미터 num={}",num);
	}

	//답변 페이지
	@RequestMapping(value = "/bbs/reply")
	public ModelAndView reply(@RequestParam String num, HttpSession session) {
		String uId_Session=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();

		if(uId_Session==null) {
			String msg="로그인 후 답변게시글 작성이 가능합니다.";
			String url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			//원본 글 정보 구하기
			BoardDTO OriginalBoard=service.selectByNum(num);
			//작성자 정보
			MemberVO vo=memberService.member_select(uId_Session);

			mav.addObject("OriginalBoard", OriginalBoard);
			mav.addObject("vo",vo);
			mav.setViewName("/bbs/reply");
		}

		return mav;
	}

	//답변 등록
	@RequestMapping(value = "/bbs/replyProc")
	public ModelAndView replyProc(HttpSession session, @RequestParam int oriRef, int oriPos, int oriDepth,
			@RequestParam String subject, 
			@RequestParam(required = false) String content) {

		String uId_Session=(String)session.getAttribute("uId_Session");
		ModelAndView mav = new ModelAndView();

		String msg="", url="";
		if(loginCheck(uId_Session)) {			//로그인체크
			MemberVO vo=memberService.member_select(uId_Session);
			String uName=vo.getuName();

			BoardDTO dto = new BoardDTO();
			dto.setRef(oriRef);		//그룹번호설정
			dto.setDepth(oriDepth+1);	//깊이
			
			//최초원본글의 답변글일 경우
			if(oriPos==0 || oriDepth==0) {
				
				//그룹이 같고, depth가 같은 게시물이 있다면
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("ref", oriRef);
				map.put("depth", oriDepth+1);
				
				int posCheck=service.checkPos(map);
				
				logger.debug("ref와 depth가 같은 게시물 수 : ",posCheck);
				
				//pos max값을 구해서 +1
				if(posCheck>0) {
					int maxPos=service.maxPos(map);
					dto.setPos(maxPos+1);
				//depth가 같은 게시물이 없다면 그대로 +1처리
				}else {
					dto.setPos(oriPos+1);
				}

			//답변글의 답변글인 경우
			}else {
				//해당조건 게시물 찾기위한 map생성
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("ref", oriRef);
				map.put("pos", oriPos+1);

				//정렬을 위해 그룹번호가같고, pos가 같거나 많은 게시물이 있을 시, pos+1해준다.
				int countPos=service.countPos(map);
				if(countPos>0) {
					int updateResult=service.posUpdate(map);
					logger.debug("pos가 업데이트 된 게시물=",updateResult);
					dto.setPos(oriPos+1);
				}
				
			}
			
			//게시물 정보 set
			dto.setuId(uId_Session);
			dto.setuName(uName);
			dto.setSubject(subject);
			dto.setContent(content);
			
			int cnt=service.insertReply(dto);

			if(cnt>0){
				msg="답변글이 등록되었습니다.";
				url="/bbs/list";
			}else{
				msg="답변글 등록 중 에러 발생!";
				url="/bbs/list";
			}
		}else {
			msg="로그인 후 답변등록이 가능합니다.";
			url="/member/login";
		}

		mav.setViewName("/common/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}

	//게시글 수정 페이지
	@RequestMapping(value = "/bbs/update")
	public ModelAndView update(@RequestParam String num, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		//로그인 여부 확인
		String uId_Session=(String)session.getAttribute("uId_Session");

		boolean loginCheck=loginCheck(uId_Session);
		//로그인 되어있을 때
		if(loginCheck) {
			BoardDTO dto=service.selectByNum(num);
			mav.addObject("dto", dto);
			mav.setViewName("/bbs/modify");
		}else {	//비로그인
			String msg="로그인 후 수정이 가능합니다.",
					url="/member/login";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.setViewName("/common/message");
		}

		return mav;
	}

	//게시글 수정 처리
	@RequestMapping(value = "/bbs/modifyFrm", method = RequestMethod.POST)
	public ModelAndView modifyFrm(@ModelAttribute BoardDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String uId_Session=(String)session.getAttribute("uId_Session");
		boolean loginCheck=loginCheck(uId_Session);

		String msg="", url="";
		//로그인 되어있을 때
		if(loginCheck) {
			int cnt=service.updateBoard(dto);
			if(cnt>0) {
				msg="게시글이 수정되었습니다.";
				url="/bbs/list?num="+dto.getNum();
			}else {
				msg="게시글 수정 중 에러 발생";
				url="/bbs/list?num="+dto.getNum();
			}
		}else {	//비로그인
			msg="로그인 후 수정이 가능합니다.";
			url="/member/login";
		}

		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("/common/message");
		return mav;
	}

	//게시글 삭제
	@RequestMapping(value = "/bbs/delete")
	public ModelAndView delete(@RequestParam String num, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		//로그인 여부 확인
		String uId_Session=(String)session.getAttribute("uId_Session");
		boolean loginCheck=loginCheck(uId_Session);

		String msg="", url="";
		if(loginCheck) { //로그인 되어있을 때
			
			//게시물의 ref, depth구하기
			int ref=service.checkBoard(num);
			int depth=service.checkBoard2(num);
			
			logger.info("ref={}",ref);
			logger.info("depth={}",depth);
			
			//게시물에 답변글이있는지 확인
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ref", ref);
			map.put("depth", depth);
			
			int count=service.checkReboard(map);
			
			//게시물에 답변글이 있을때 삭제처리
			if(count>0) {		
				int cnt=service.delBoard(num);
					if(cnt>0) {
						msg="게시물이 삭제되었습니다.";
						url="/bbs/list";
					}else {
						msg="게시물 삭제 중 에러 발생!";
						url="/bbs/delete";
					}
			//일반글 삭제처리
			}else {
				int cnt=service.deleteBoard(num);
				if(cnt>0) {
					msg="게시물이 삭제되었습니다.";
					url="/bbs/list";
				}else {
					msg="게시물 삭제 중 에러 발생!";
					url="/bbs/delete";
				}
			}
			
		}else {	//비로그인
			msg="로그인 후 삭제가 가능합니다.";
			url="/member/login";
		}
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("/common/message");

		return mav;
	}

}
