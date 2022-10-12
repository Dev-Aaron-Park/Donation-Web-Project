package org.aaronpark.donation.board;

import javax.servlet.http.HttpServletRequest;

import org.aaronpark.donation.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardGo(HttpServletRequest req) {
		mDAO.isLogined(req);
		req.setAttribute("contentsPage", "board/main.jsp");
		return "index";
	}
}
