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
		return "member/login";
	}
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String joinDo(Member m, HttpServletRequest req) {
		mDAO.create(m, req);
		return "index";
	}
}
