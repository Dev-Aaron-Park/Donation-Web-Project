package org.aaronpark.donation.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	public boolean isLogined(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			req.setAttribute("isLogined", true);
			return true;
		}
		req.setAttribute("isLogined", false);
		return false;
	}
	
	public void login(Member inputMember, HttpServletRequest req) {
		try {
			Member dbMember = ss.getMapper(MemberMapper.class).getMemberByID(inputMember);
			if (dbMember != null) {
				if (inputMember.getMember_pw().equals(dbMember.getMember_pw())) {
					req.getSession().setAttribute("loginMember", dbMember);
					req.setAttribute("result", "Login Success");
				} else {
					req.setAttribute("result", "Login Failed(Password Error)");
				}
				
			} else {
				req.setAttribute("result", "Login Failed(None Member)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Login Failed(DB Server Error)");
		}
	}
	
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}
	
	public void signup(Member m, HttpServletRequest req) {
		try {
			if (ss.getMapper(MemberMapper.class).signup(m) == 1) {
				System.out.println("Member Create Success");
			} else {
				System.out.println("Member Create Failed");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Member Create Failed");
		}
	}
	
	
}
