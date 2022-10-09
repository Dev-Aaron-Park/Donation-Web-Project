package org.aaronpark.donation.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void create(Member m, HttpServletRequest req) {
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
