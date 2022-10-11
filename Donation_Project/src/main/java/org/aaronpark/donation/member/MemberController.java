package org.aaronpark.donation.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/member.go", method = RequestMethod.GET)
	public String memberGo(HttpServletRequest req) {
		req.setAttribute("contentsPage", "member/login.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String joinDo(Member m, HttpServletRequest req) {
		mDAO.signup(m, req);
		req.setAttribute("contentsPage", "member/login.jsp");
		return "index";
	}
	
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
}
