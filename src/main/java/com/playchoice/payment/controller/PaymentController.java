package com.playchoice.payment.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.member.dto.MemberDTO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.payment.dto.PaymentSearchDTO;
import com.playchoice.payment.service.PaymentService;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.service.PlayService;
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

	@RequestMapping(value = "play/payment", method = RequestMethod.POST)
	public String paymentController(Model model,
									@RequestParam int p_quantity,
									@RequestParam int s_id) throws Exception {
		// TODO 로그인여부 확인(인터셉터)
		
		ScheduleDTO schedule = scheduleService.getSchedule(s_id);
		PlayDTO play = playService.playDetail(schedule.getP_id());
		
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
		
		PaymentDTO payment = new PaymentDTO();
		payment.setS_id(s_id);
		payment.setP_quantity(p_quantity);
		payment.setM_code(user.getM_code());
		payment.setP_price(scheduleService.discountedPrice(schedule) * p_quantity);

		service.insertPayment(payment);
		
		return "redirect:/payment/info?p_id=" + payment.getP_id();
	}
	
// TODO: MemberController로 옮기기
	@RequestMapping("member/paymentList")
	public String memberPaymentListController(Model model, HttpSession session, PaymentSearchDTO dto, boolean watched) {
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		
		dto.setMember(user.getM_code());
		dto.setPlayAdmin(null);
		System.out.println(watched);
		// 취소 안된 연극중 끝난 연극 검색
		if (watched) {
			dto.setCanceled(0);
			dto.setScheduleEnded(1);
		}
		
		model.addAttribute("paymentList", service.searchPayment(dto));
		
		return "payment/memberPaymentList";
	}
	
	@RequestMapping("admin/site/paymentList")
	public String siteAdminPaymentListController(Model model, HttpSession session, PaymentSearchDTO dto) {
//		MemberDTO user = (MemberDTO) session.getAttribute("login");
		
		model.addAttribute("paymentList", service.searchPayment(dto));
		
		return "payment/siteAdminPaymentList";
	}
	
	@RequestMapping("admin/play/paymentList")
	public String playAdminPaymentListController(Model model, HttpSession session, PaymentSearchDTO dto) {
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		
		dto.setPlayAdmin(user.getM_code());
		
		model.addAttribute("paymentList", service.searchPayment(dto));
		
		return "payment/playAdminPaymentList";
	}
	
	@RequestMapping(value = "payment/list")
	public String paymentListController(Model model, PaymentSearchDTO dto) {
		model.addAttribute("paymentList", service.searchPayment(dto));
		return "payment/list";
	}

	@RequestMapping(value = "payment/info", method = RequestMethod.GET)
	public String paymentInfoController(HttpSession session, Model model,
												@RequestParam int p_id) throws Exception {
		PaymentDTO payment = service.getPayment(p_id);
		MemberDTO user = (MemberDTO) session.getAttribute("login");
		if (user.getM_code() != payment.getM_code() // 일반 회원
//				&& !(user.getM_level() == 1 && ) // 연극 관리자
				&& user.getM_level() != 2) // 사이트 관리자
			return "";
		
		ScheduleDTO schedule = scheduleService.getSchedule(payment.getS_id());
		PlayDTO play = playService.playDetail(schedule.getP_id());
		
		model.addAttribute("schedule", schedule);
		model.addAttribute("play", play);
		model.addAttribute("payment", payment);
		model.addAttribute("refund", -service.refund(payment));
		model.addAttribute("scheduleEnded", schedule.getS_time().compareTo(new Date()) <= 0);
		
		return "payment/info";
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
