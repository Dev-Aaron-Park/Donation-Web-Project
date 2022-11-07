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
	
	@Autowired
	private BoardDAO bDAO;
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardGo(HttpServletRequest req) {
		mDAO.isLogined(req);
		bDAO.showInitPost(req);
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
		bDAO.showInitPost(req);
		req.setAttribute("contentsPage", "board/main.jsp");
		mDAO.isLogined(req);
		return "index";
	}
	
}
