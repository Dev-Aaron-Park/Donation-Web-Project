package org.aaronpark.donation.comment;

import javax.servlet.http.HttpServletRequest;

import org.aaronpark.donation.board.Board;
import org.aaronpark.donation.board.BoardDAO;
import org.aaronpark.donation.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private CommentDAO cDAO;
		
	@RequestMapping(value = "/board.comment.do", method = RequestMethod.POST)
	public String boardCommentDo(Comment c, HttpServletRequest req) {
		cDAO.create(req, c);
		// 댓글 조회
		mDAO.isLogined(req);
		bDAO.selectPostOne(req);
		req.setAttribute("contentsPage", "board/postDetail.jsp");
		return "index";
	}
}
