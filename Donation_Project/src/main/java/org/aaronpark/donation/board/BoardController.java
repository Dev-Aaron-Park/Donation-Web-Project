package org.aaronpark.donation.board;

import javax.servlet.http.HttpServletRequest;

import org.aaronpark.donation.SearchManager;
import org.aaronpark.donation.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BoardDAO bDAO;
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardGo(
			@RequestParam(value="page") int p,
			HttpServletRequest req) {
		mDAO.isLogined(req);
		SearchManager.clearSearch(req);
		bDAO.showInitPost(p, req);
		req.setAttribute("contentsPage", "board/main.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.search", method = RequestMethod.GET)
	public String boardSearch(HttpServletRequest req) {
		mDAO.isLogined(req);
		SearchManager.search(req);
		bDAO.showInitPost(1, req);
		req.setAttribute("contentsPage", "board/main.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.post.go", method = RequestMethod.GET)
	public String boardPostGo(HttpServletRequest req) {
		mDAO.isLogined(req);
		bDAO.selectPostOne(req);
		req.setAttribute("contentsPage", "board/postDetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.post.del", method = RequestMethod.GET)
	public String boardPostDel(
			@RequestParam(value="page") int p,
			HttpServletRequest req) {
		bDAO.delInitPost(req);
		SearchManager.clearSearch(req);
		bDAO.showInitPost(p, req);
		req.setAttribute("contentsPage", "board/main.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/board.post.edit.do", method = RequestMethod.POST)
	public String boardPostEditDo(HttpServletRequest req) {
		mDAO.isLogined(req);
		bDAO.editPost(req);
		SearchManager.clearSearch(req);
		bDAO.showInitPost(1, req);
		req.setAttribute("contentsPage", "board/main.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/board.post.edit.go", method = RequestMethod.GET)
	public String boardPostEditGo(HttpServletRequest req) {
		mDAO.isLogined(req);
		bDAO.selectPostOne(req);
		req.setAttribute("contentsPage", "board/edit.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/mypage.donation.reg.go", method = RequestMethod.GET)
	public String mypageDonationRegGo(HttpServletRequest req) {
		req.setAttribute("mypageContents", "mypage/donation/registration.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.donation.reg.do", method = RequestMethod.POST)
	public String mypageDonationRegDo(Board b, HttpServletRequest req) {
		bDAO.create(b, req);
		req.setAttribute("mypageContents", "mypage/myAccount.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.mng.post", method = RequestMethod.GET)
	public String mypageMngPostGo(
			@RequestParam(value="page") int p,
			HttpServletRequest req) {
		SearchManager.clearSearch(req);
		bDAO.decReqPost(req);
		bDAO.showReqPost(req);
		bDAO.showInitPost(p, req);
		req.setAttribute("mypageContents", "mypage/management/post.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.mng.post.search", method = RequestMethod.GET)
	public String mypageMngPostSearch(HttpServletRequest req) {
		bDAO.decReqPost(req);
		SearchManager.search(req);
		bDAO.showReqPost(req);
		bDAO.showInitPost(1, req);
		req.setAttribute("mypageContents", "mypage/management/post.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.mng.post.del", method = RequestMethod.GET)
	public String mypageMngPostDel(
			@RequestParam(value="page") int p,
			HttpServletRequest req) {
		bDAO.delInitPost(req);
		bDAO.showReqPost(req);
		bDAO.showInitPost(p, req);
		req.setAttribute("mypageContents", "mypage/management/post.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/pay.approve", method = RequestMethod.GET)
	public String payApprove(HttpServletRequest req) {
		mDAO.isLogined(req);
		req.setAttribute("contentsPage", "board/payment.jsp");
		return "index";
	}
}
