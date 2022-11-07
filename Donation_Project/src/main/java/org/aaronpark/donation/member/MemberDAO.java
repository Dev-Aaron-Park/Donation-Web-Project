package org.aaronpark.donation.member;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void edit(Member m, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/profilePhoto");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 31457280,
					"utf-8", new DefaultFileRenamePolicy());
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Member Edit Failed(Photo)");
			return;
		}
		
		Member loginedMember = (Member) req.getSession().getAttribute("loginMember");
		String oldPhoto = loginedMember.getMember_photo();
		String newPhoto = null;
		try {
			String id = mr.getParameter("member_id");
			String pw = mr.getParameter("member_pw");
			String email = mr.getParameter("member_email");
			
			newPhoto = mr.getFilesystemName("member_photo");
			if (newPhoto == null) {
				newPhoto = oldPhoto;
			} else {
				newPhoto = URLEncoder.encode(newPhoto, "utf-8").replace("+", " ");
			}
			
			m.setMember_id(id);
			m.setMember_pw(pw);
			m.setMember_email(email);
			m.setMember_photo(newPhoto);
			
			// 총 관리자 : 9, 관리자 : 8, 일반 : 0
			m.setMember_permissions(loginedMember.getMember_permissions());
			
			if (ss.getMapper(MemberMapper.class).edit(m) == 1) {
				req.setAttribute("result", "Member Edit Success");
				req.getSession().setAttribute("loginMember", m);
				if (!newPhoto.equals(oldPhoto)) {
					oldPhoto = URLDecoder.decode(oldPhoto, "utf-8");
					new File(path + "/" + oldPhoto).delete();
				}
			} else {
				req.setAttribute("result", "Member Edit Failed");
				if (!newPhoto.equals(oldPhoto)) {
					newPhoto = URLDecoder.decode(newPhoto, "utf-8");
					new File(path + "/" + newPhoto).delete();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Member Edit Failed");
			if (!newPhoto.equals(oldPhoto)) {
				try {
					newPhoto = URLDecoder.decode(newPhoto, "utf-8");
				} catch (UnsupportedEncodingException e1) {
				}
				new File(path + "/" + newPhoto).delete();
			}
		}
		
		
	}
	
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
		// D:\eGovFrameDev-3.9.0-64bit\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Donation_Project\resources\profilePhoto
		String path = req.getSession().getServletContext().getRealPath("resources/profilePhoto");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 31457280,
					"utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Member Create Failed(Photo Error)");
			return;
		}
		
		try {
			String id = mr.getParameter("member_id");
			String pw = mr.getParameter("member_pw");
			String email = mr.getParameter("member_email");
			String photo = mr.getFilesystemName("member_photo");
			photo = URLEncoder.encode(photo, "utf-8").replace("+", " ");
			
			m.setMember_id(id);
			m.setMember_pw(pw);
			m.setMember_email(email);
			m.setMember_photo(photo);
			m.setMember_permissions(new BigDecimal(0));
			
			if (ss.getMapper(MemberMapper.class).signup(m) == 1) {
				req.setAttribute("result", "Member Create Success");
			} else {
				new File(path + "/" + mr.getFilesystemName("member_photo")).delete();
				req.setAttribute("result", "Member Create Failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new File(path + "/" + mr.getFilesystemName("member_photo")).delete();
			req.setAttribute("result", "Member Create Failed");
		}
	}
	
	public void getAdminMember(HttpServletRequest req) {
		req.setAttribute("adminMembers", ss.getMapper(MemberMapper.class).getAdminMember());
	}
	
	public void getGeneralMember(HttpServletRequest req) {
		req.setAttribute("getNormalMember", ss.getMapper(MemberMapper.class).getNormalMember());
	}
	
	public void memberPermChange(HttpServletRequest req) {
		String id = req.getParameter("id");
		if (id == null) {
			return;
		}
		
		try {
			BigDecimal per = new BigDecimal(Integer.parseInt(req.getParameter("per")));
			Member m = new Member();
			m.setMember_id(id);
			m.setMember_permissions(per);
			if (ss.getMapper(MemberMapper.class).memberPermChange(m) == 1) {
				req.setAttribute("result", "Member Permissions Change Success");
			} else {
				req.setAttribute("result", "Member Permissions Change Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Member Permissions Change Failed");
		}
	}
	
	public void memberAddAdmin(HttpServletRequest req) {
		
	}
}
















