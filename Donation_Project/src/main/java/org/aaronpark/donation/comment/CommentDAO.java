package org.aaronpark.donation.comment;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentDAO {
	@Autowired
	private SqlSession ss;
	
	public void create(HttpServletRequest req, Comment c) {
		try {
			System.out.println(c.getComment_board_no());
			System.out.println(c.getComment_member());
			System.out.println(c.getComment_text());
			if (ss.getMapper(CommentMapper.class).create(c) == 1) {
				req.setAttribute("result", "Comment Create Success");
			} else {
				req.setAttribute("result", "Comment Create Failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Comment Create Failed");
		}
	}
}
