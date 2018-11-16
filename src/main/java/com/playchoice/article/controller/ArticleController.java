package com.playchoice.article.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/article/{articlepath}")
public class ArticleController {
	@RequestMapping("notice")
	public String noticeListController() {
		return "";
	}

	@RequestMapping("notice/{no}")
	public String noticeDetailController(@PathVariable(name = "no") int no) {
		return "";
	}

	@RequestMapping("FAQ")
	public String FAQListController() {
		return "";
	}

	@RequestMapping("FAQ/{no}")
	public String FAQDetailController(@PathVariable(name = "no") int no) {
		return "";
	}

	@RequestMapping("contact")
	public String contactListController() {
		return "";
	}

	// require login
	@RequestMapping("contact/{no}")
	public String contactDetailController(@PathVariable(name = "no") int no) {
		return "";
	}
}

// @Autowired
// CustomerCenterDAO dao;
//
// @ModelAttribute("data")
// public void articleList(@PathVariable("articlepath") String article,
// ArticleDTO dto, HttpServletRequest request) {
// Object res = null;
// // a_target 1 = 공지사항 2 = FAQ 3 = 1:1 문의
// switch (article) {
// case "customergongi":
// res = dao.list("1");
// break;
// case "customerfaq":
// res = dao.list("2");
// break;
// case "customerprivate":
// res = dao.list("3");
// break;
// case "customerprivatewrite":
// break;
// case "customerprivatedetail":
// break;
// }
// }
//
// @RequestMapping()
// String view(@PathVariable("articlepath") String article) {
// String path = "article/" + article;
// String[] arrPath = {
// /*
// * "customergongi", "customerfaq", "customerprivate", "customerprivatewrite",
// * "customerprivatedetail"
// */
// };
//
// if (Arrays.asList(arrPath).contains(article))
// path = "article/alert";
//
// return path;
// }

// PageStatus status = new PageStatus();

/*
 * a_target 1 = 공지사항 2 = FAQ 3 = 1:1 문의
 */
// 공지사항 리스트 기본 로딩
// @RequestMapping("/customergongi")
// Object getGongi() {
// res = dao.list("1");
// System.out.println(res);
// return res;
// }
//
// @RequestMapping()
// String view(@PathVariable("page") String service) {
// System.out.println("41414");
// return "page/customergongi";
// }
//
// // FAQ 리스트 로딩
// @RequestMapping("/customerfaq")
// String getFAQ() {
// dao.list("2");
// System.out.println("page/customerfaq");
// return "page/customerfaq";
// }
//
// // 1:1 문의 리스트 로딩
// @RequestMapping("page/customerprivate")
// String getPrivate() {
// System.out.println("page/customerprivate");
//
// dao.list("3");
// return "page/customerprivate";
// }

// 1:1 문의 글 작성
// @RequestMapping(value = "page/customerprivatewrite", method =
// RequestMethod.POST)
// String postPrivatewrite(HttpServletRequest request) {
// System.out.println("page/customerprivatewrite");
// ArticleDTO dto = new ArticleDTO();
// dto.setA_title((String) request.getAttribute("a_title"));
// dto.setA_content((String) request.getAttribute("a_content"));
//
// dao.insertOne(dto);
// return "page/customerprivatewrite";
// }
//
// // 1:1 문의 글 자세히 보기
// @RequestMapping(value = "page/customerprivatedetail", method =
// RequestMethod.GET)
// String postPrivatedetail(HttpServletRequest request) {
// System.out.println("page/customerprivatewrite");
// // dao.selectOne(request.getAttribute("a_id"));
// return "page/customerprivatewrite";
// }

// @ModelAttribute("data")
// public Object dataGo(@PathVariable("service") String service, ArticleDTO dto,
// HttpServletRequest request) {
// Object res = null;
// switch (service) {
// case "list":
// res = dao.list(dto);
// break;
// case "detail":
// break;
// case "modifyForm":
// res = dao.selectOne(dto);
// break;
//
// case "insertReg":
// dao.insertOne(dto);
//
// status.setMsg("작성되었습니다.");
// status.setUrl("detail?id=" + dto.getA_id());
// res = dto;
// break;
//
// case "insertMultiReg":
// status.setMsg("수정되었습니다.");
// status.setUrl("list");
// res = dto;
//
// break;
//
// case "deleteReg":
// status.setMsg("삭제실패");
// status.setUrl("deleteForm?id=" + dto.getA_id());
//
// if ((int) dao.deleteOne(dto) >= 1) {
// status.setMsg("삭제성공");
// status.setUrl("list");
// }
// res = dto;
// case "modifyReg":
//
// status.setMsg("수정 실패");
// status.setUrl("modifyForm?id=" + dto.getA_id());
//
// if ((int) dao.modifyOne(dto) >= 1) {
// status.setMsg("수정되었습니다.");
// status.setUrl("detail?id=" + dto.getA_id());
// }
// res = dto;
//
// break;
// }
// return res;
// }
//
// @RequestMapping()
// public String view(@PathVariable("service") String service) {
//
// String res = "page/" + service;
//
// String[] arr = { "deleteReg", "modifyReg", "insertReg", "insertMultiReg",
// "insertErrorReg" };
//
// if (Arrays.asList(arr).contains(service)) {
// res = "mybatis/alert";
// }
// return res;
// }
//
// // 글 수정
// @RequestMapping(value = "page/customerprivatewrite", method =
// RequestMethod.POST)
// String postPrivatemodify() {
// System.out.println("page/customerprivatewrite");
// return "page/customerprivatewrite";
// }
//
// // 글 삭제
// @RequestMapping(value = "page/customerprivatewrite", method =
// RequestMethod.POST)
// String postPrivatedelete() {
// System.out.println("page/customerprivatewrite");
// return "page/customerprivatewrite";
// }
