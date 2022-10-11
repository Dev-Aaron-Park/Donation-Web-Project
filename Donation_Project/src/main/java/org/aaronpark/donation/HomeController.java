package org.aaronpark.donation;

import javax.servlet.http.HttpServletRequest;

import org.aaronpark.donation.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		mDAO.isLogined(req);
		req.setAttribute("contentsPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/index.go", method = RequestMethod.GET)
	public String indexGo(HttpServletRequest req) {
		mDAO.isLogined(req);
		req.setAttribute("contentsPage", "home.jsp");
		return "index";
	}
}
