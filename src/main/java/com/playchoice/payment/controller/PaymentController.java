package com.playchoice.payment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.admin.service.SiteAdminService;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.payment.dto.PaymentSearchDTO;
import com.playchoice.payment.service.PaymentService;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.service.PlayService;
import com.playchoice.review.service.ReviewService;
import com.playchoice.schedule.dto.ScheduleDTO;
import com.playchoice.schedule.service.ScheduleService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private PlayService playService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private SiteAdminService siteAdminService;

	@RequestMapping(value = "play/payment", method = RequestMethod.POST)
	public String paymentController(Model model,
									@RequestParam int p_quantity,
									@RequestParam int s_id) throws Exception {
		ScheduleDTO schedule = scheduleService.getSchedule(s_id);
		PlayDTO play = playService.playDetail(schedule.getP_id());

		if (p_quantity > scheduleService.ticketLeft(schedule)) {
			p_quantity = scheduleService.ticketLeft(schedule);
		}
		
		model.addAttribute("schedule", schedule);
		model.addAttribute("play", play);
		model.addAttribute("quantity", p_quantity);
		model.addAttribute("discountedPrice", scheduleService.discountedPrice(schedule));
		
		return "payment/payment";
	}

	@RequestMapping(value = "play/payAction", method = RequestMethod.POST)
	public String paymentActionController(Model model, HttpSession session,
								@RequestParam int s_id, 
								@RequestParam int p_quantity,
								@RequestParam String cardno,
								@RequestParam String validityYear,
								@RequestParam String validityMonth) throws Exception {
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		
//		System.out.println("cardno : " + cardno	+ "validity : " + validityYear + "/" + validityMonth);
		ScheduleDTO schedule = scheduleService.getSchedule(s_id);
		
		// 티켓 수량이 부족
		if (p_quantity > scheduleService.ticketLeft(schedule)) {
			return "redirect:/play/playdetail?&p_id=" + schedule.getP_id();
		}
		
		PaymentDTO payment = new PaymentDTO();
		payment.setS_id(s_id);
		payment.setP_quantity(p_quantity);
		payment.setM_code(user.getM_code());
		payment.setP_price(scheduleService.discountedPrice(schedule) * p_quantity);

		service.insertPayment(payment);
		
		return "redirect:/payment/info?p_id=" + payment.getP_id();
	}
	
	@RequestMapping("member/paymentList")
	public String memberPaymentListController(Model model, HttpSession session, PaymentSearchDTO dto, boolean watched) {
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		
		dto.setMember(user.getM_id());
		dto.setPlayAdmin(null);
		// 취소 안된 연극중 끝난 연극 검색
		if (watched) {
			dto.setCanceled(0);
			dto.setScheduleEnded(1);
		} else {
			dto.setCanceled(null);
			dto.setScheduleEnded(null);
		}

		int count = service.paymentCount(dto);
		int firstPage = Math.max(dto.getPage() - 4, 1);
		int lastPage = Math.min((count - 1) / dto.getRow() + 1, dto.getPage() + 4);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		if (count != 0) {
			model.addAttribute("paymentList", service.searchPayment(dto));
		}
		
		return "payment/memberPaymentList";
	}
	
	@RequestMapping("admin/site/paymentList")
	public String siteAdminPaymentListController(Model model, HttpSession session, PaymentSearchDTO dto) {
		int count = service.paymentCount(dto);
		int firstPage = Math.max(dto.getPage() - 4, 1);
		int lastPage = Math.min((count - 1) / dto.getRow() + 1, dto.getPage() + 4);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		if (count != 0) {
			model.addAttribute("paymentList", service.searchPayment(dto));
		}
		
		return "payment/siteAdminPaymentList";
	}
	
	@RequestMapping("admin/play/paymentList")
	public String playAdminPaymentListController(Model model, HttpSession session, PaymentSearchDTO dto) {
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		
		dto.setPlayAdmin(user.getM_id());
		
		int count = service.paymentCount(dto);
		int firstPage = Math.max(dto.getPage() - 4, 1);
		int lastPage = Math.min((count - 1) / dto.getRow() + 1, dto.getPage() + 4);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		if (count != 0) {
			model.addAttribute("paymentList", service.searchPayment(dto));
		}
		
		return "payment/playAdminPaymentList";
	}
	
	@RequestMapping(value = "payment/info", method = RequestMethod.GET)
	public String paymentInfoController(HttpSession session, Model model, @RequestParam int p_id) throws Exception {
		PaymentDTO payment = service.getPayment(p_id);
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		ScheduleDTO schedule = scheduleService.getSchedule(payment.getS_id());
		PlayDTO play = playService.playDetail(schedule.getP_id());
 
 		int level = 0;
		if (user.getM_level() == 2) { // 사이트 관리자
			level = 2;
		} else if (user.getM_level() == 1 && user.getM_code() == play.getM_code()) { // 연극 관리자
			level = 1;
		} else if (user.getM_code() == payment.getM_code()) { // 일반 회원
			level = 0;
		} else
			return "";
		
		model.addAttribute("schedule", schedule);
		model.addAttribute("play", play);
		model.addAttribute("payment", payment);
		
		switch (level) {
		case 0:
			model.addAttribute("refund", -service.refund(payment));
			model.addAttribute("canReview", reviewService.canWriteReview(user.getM_code(), payment.getP_id()));
			model.addAttribute("isReviewExist", reviewService.isReviewExist(user.getM_code(), payment.getS_id()));
			return "payment/memberInfo";
		case 1:
		case 2:
			MemberDTO buyer = siteAdminService.getMember(payment.getM_code());
			model.addAttribute("buyer", buyer);
			return "payment/adminInfo";
		default:
			break;
		}
		return "";
	}

	@RequestMapping(value = "payment/cancel", method = RequestMethod.POST)
	public String paymentCancelActionController(HttpSession session, @RequestParam int p_id) throws Exception {
		PaymentDTO payment = service.getPayment(p_id);
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		if (user.getM_code() != payment.getM_code())
			return "";
		
		PaymentDTO cancel = service.cancelPayment(payment);
		
		if (cancel == null) // 환불 불가인 경우, javscript 에서 먼저 검사해야함
			return "";
		
		return "redirect:/member/paymentList";
	}
}
