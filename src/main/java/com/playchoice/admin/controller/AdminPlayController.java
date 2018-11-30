package com.playchoice.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.playchoice.actor.dao.ActorDAOImpl;
import com.playchoice.actor.dao.PlayAppearDAOImpl;
import com.playchoice.actor.service.ActorService;
import com.playchoice.admin.service.AdminPlayService;
import com.playchoice.admin.service.FileService;
import com.playchoice.admin.service.SiteAdminService;
import com.playchoice.common.PageDTO;
import com.playchoice.common.Pagination;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;


/**
 * 연극 관리자 메뉴
 * 연극 추가, 연극 정보 수정, 정산
 */
@Controller
@RequestMapping("admin/play")
public class AdminPlayController {
	
	@Autowired
	private AdminPlayService service;
	
	@Autowired
	private SiteAdminService sservice;

	
	@Autowired
	private ActorDAOImpl adao;
	
	@Autowired
	private PlayAppearDAOImpl padao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminPlayController.class);
	
	//리스트
	@RequestMapping(value="aplist", method=RequestMethod.GET)
	public String listAll(Model model, HttpSession session) throws Exception{
		logger.info("list all show....................");
		
		//session login 정보 가져옴 / list로 불러온것을 객체 res에 저장
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		
		
		//세션 체크해서 level 이 1이 아닐시 list가 보이지 않게 설정.,.. 단 DB에는 값이 입력되므로 수정 요망
		if(user != null) {
			int level = user.getM_level();
			if(level == 1) {
				Object res = service.listAll(user);
				
				model.addAttribute("list", res); //res 와 list 보냄
				return "/admin/play/aplist";
			}else {
				model.addAttribute("msg", "NotAuth"); //접근된 사용자가 아닙니다.
				return "redirect:/";
			}
		}else {
			
//			model.addAttribute("msg", "로그인을 해야 합니다.");
//			model.addAttribute("url", "/login");
//			return "redirect:/member/loginAlert";
			
			model.addAttribute("msg", "Login"); //로그인을 해야 합니다.
			return "redirect:/member/login";
		}
		
		/*Object res = service.listAll(user);
		
//		System.out.println(res);
		model.addAttribute("list", res); //res 와 list 보냄	
*/	
	}
	
	//조회
	@RequestMapping(value="apread", method=RequestMethod.GET)
	public void read(@RequestParam("p_id") int p_id, Model model) throws Exception{
		logger.info("list read show....................");
		model.addAttribute(service.read(p_id));

	}
		
	
	//생성
	@RequestMapping(value="apregister", method=RequestMethod.GET)
	public void registerGET(PlayDTO dto, Model model) throws Exception{
		logger.info("register get.............");
		model.addAttribute("glist",sservice.genreList()); //장르 리스트 가져오기
		model.addAttribute("alist",sservice.areaList()); //지역 리스트 가져오기
		
	}

	@RequestMapping(value="apregister", method=RequestMethod.POST)
	public String registerPOST(PlayDTO dto,
			MultipartHttpServletRequest request, RedirectAttributes rttr, HttpSession session) throws Exception{
		logger.info("apregister............");
		//dto.getP_image().stream().forEach(file -> logger.info(file.getOriginalFilename()));
		
		//session -> login 설정 / dto로 저장
		MemberDTO user = (MemberDTO) session.getAttribute("login");		
		dto.setM_code(user.getM_code());
		
		
		FileService fs = new FileService(request);
		//이미지 생성 및 이미지 체크
		
		//이름부분을 th 라는 String 변수 입력
		String th = fs.imageUpload(dto.getP_image().get(0));
		if(th == null) {
			rttr.addFlashAttribute("msg", "필수 선택 입력값을 입력 하지 않았습니다.");
			return "redirect:apregister";
		}else {
		System.out.println("th:"+th);
		dto.setP_image0(th);
		
		dto.setP_image1(fs.imageUpload(dto.getP_image().get(1)));
		dto.setP_image2(fs.imageUpload(dto.getP_image().get(2)));
		dto.setP_image3(fs.imageUpload(dto.getP_image().get(3)));
		dto.setP_image4(fs.imageUpload(dto.getP_image().get(4)));
		System.out.println(dto);
		
		//DB insert
		service.regist(dto);
		
		//th변수(image0)의 크기를 조절하는 썸네일을 만든다
		fs.setThumb(th);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/play/aplist";
		}		
	}

	//수정
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public void modifyGET(int p_id, Model model) throws Exception{
		model.addAttribute(service.read(p_id));
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyPOST(PlayDTO dto,
			MultipartHttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		logger.info("mod post............");
		dto.getP_image().stream().forEach(file -> logger.info(file.getOriginalFilename()));
		FileService fs = new FileService(request);
		
		//이미지 생성 및 이미지 체크
		String th = fs.imageUpload(dto.getP_image().get(0));
		System.out.println("th:"+th);
		dto.setP_image0(th);
		
		dto.setP_image1(fs.imageUpload(dto.getP_image().get(1)));
		dto.setP_image2(fs.imageUpload(dto.getP_image().get(2)));
		dto.setP_image3(fs.imageUpload(dto.getP_image().get(3)));
		dto.setP_image4(fs.imageUpload(dto.getP_image().get(4)));
		
		if(th != null) {
			fs.setThumb(th);
		}
		service.modify(dto);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/play/aplist";
	}
	
	
	//삭제
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String remove(@RequestParam("p_id")int p_id, RedirectAttributes rttr) throws Exception{
		service.remove(p_id);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/play/aplist";
	}
	
	//게시
	@RequestMapping(value="flurry", method=RequestMethod.POST)
	public String flurry(@RequestParam("p_id")int p_id, RedirectAttributes rttr) throws Exception{
		service.flurry(p_id);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/play/aplist";
	}
	
	//일정 조회
	@RequestMapping(value="pslist", method=RequestMethod.GET)
	public void psread(PageDTO pdto,@RequestParam("p_id") int p_id, Model model, HttpSession session) throws Exception{
		logger.info("list psread show....................");
		
		pdto.setPerPage(10);
		
		model.addAttribute("key", service.psreadPaging(p_id,pdto));
		//key 값을 key로 만들어 service.psread(p_id) 내용을 사용
		System.out.println(service.psread(p_id));
		model.addAttribute("actorlist", adao.listActor()); //actor 리스트 가져오기
		
		int m_code = ((MemberDTO) session.getAttribute("login")).getM_code();
		
//		List<ScheduleDTO> list = service.psreadPaging(m_code, pdto);
		
		Pagination pagination = new Pagination(pdto);
		pagination.setTotalCnt(service.psreadCount(p_id));
		
		//model.addAttribute("list",list);
		model.addAttribute("paging", pagination);
	}
	
	//일정 생성
	@RequestMapping(value="psregister", method=RequestMethod.GET)
	public void psregisterGET(ScheduleDTO sdto,
			@RequestParam("p_id") int p_id, Model model) throws Exception{
		logger.info("psregister get.............");
		System.out.println(sdto);
		model.addAttribute("actorlist", adao.listActor()); //actor 리스트 가져오기
		model.addAttribute("palist", padao.palist(p_id));
				
	}
	@RequestMapping(value="psregister", method=RequestMethod.POST)
	public String psregisterPOST(ScheduleDTO sdto, RedirectAttributes rttr) throws Exception{
		logger.info("psregister post.............");
		
		System.out.println(sdto);
		System.out.println(sdto.getP_id());

		service.psregist(sdto);
//		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:pslist?p_id="+sdto.getP_id();
		//pslist로 이동 ->  p_id에 대하여 sdto.getP_id() 로 이동
		
	}
	
	//일정 업데이트
	
	@RequestMapping(value="psmodify", method=RequestMethod.POST)
	public String psmodifyPOST(ScheduleDTO sdto, RedirectAttributes rttr) throws Exception{
		
		service.psmodify(sdto);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:pslist?p_id="+sdto.getP_id();
	}

}
