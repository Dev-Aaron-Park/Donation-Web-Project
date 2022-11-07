package org.aaronpark.donation.member;

import javax.servlet.http.HttpServletRequest;

import org.aaronpark.donation.board.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BoardDAO bDAO;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(Member m, HttpServletRequest req) {
		req.setAttribute("contentsPage", "home.jsp");
		mDAO.login(m, req);
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutDo(Member m, HttpServletRequest req) {
		req.setAttribute("contentsPage", "home.jsp");
		mDAO.logout(req);
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.edit.do", method = RequestMethod.POST)
	public String editDo(Member m, HttpServletRequest req) {
		req.setAttribute("mypageContents", "mypage/myAccount.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.edit(m, req);
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/member.go", method = RequestMethod.GET)
	public String memberGo(HttpServletRequest req) {
		req.setAttribute("contentsPage", "member/login.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "/mypage.go", method = RequestMethod.GET)
	public String mypageGo(HttpServletRequest req) {
		req.setAttribute("mypageContents", "mypage/myAccount.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.mng.member", method = RequestMethod.GET)
	public String mypageMngMemberGo(HttpServletRequest req) {
		mDAO.memberPermChange(req);
		mDAO.getAdminMember(req);
		mDAO.getGeneralMember(req);
		req.setAttribute("mypageContents", "mypage/management/member.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.mng.post", method = RequestMethod.GET)
	public String mypageMngPostGo(HttpServletRequest req) {
		bDAO.decReqPost(req);
		bDAO.showReqPost(req);
		bDAO.showInitPost(req);
		req.setAttribute("mypageContents", "mypage/management/post.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.mng.post.del", method = RequestMethod.GET)
	public String mypageMngPostDel(HttpServletRequest req) {
		bDAO.delInitPost(req);
		bDAO.showReqPost(req);
		bDAO.showInitPost(req);
		req.setAttribute("mypageContents", "mypage/management/post.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/mypage.myaccount.go", method = RequestMethod.GET)
	public String myAccountGo(HttpServletRequest req) {
		req.setAttribute("mypageContents", "mypage/myAccount.jsp");
		req.setAttribute("contentsPage", "member/mypage.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String joinDo(Member m, HttpServletRequest req) {
		mDAO.signup(m, req);
		req.setAttribute("contentsPage", "member/login.jsp");
		return "index";
	}
	
}
