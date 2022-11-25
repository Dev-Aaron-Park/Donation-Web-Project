package org.aaronpark.donation.board;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.aaronpark.donation.ManagementsAttr;
import org.aaronpark.donation.PageManager;
import org.aaronpark.donation.member.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BoardDAO {
	private int showAllCount;
	
	@Autowired
	private ManagementsAttr ma;
	
	@Autowired
	private SqlSession ss;
	
	public void setShowAllCount(PageManager pm) {
		showAllCount = ss.getMapper(BoardMapper.class).showAllCount(pm);
	}
	
	public void setShowAllCount(int count) {
		showAllCount -= count;
	}
	
	public void create(Board b, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/boardPhoto");
		System.out.println(path);
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 31457280,
					"utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Board Create Failed(Photo)");
			return;
		}
		
		Member loginedMember = (Member) req.getSession().getAttribute("loginMember");
		String id = loginedMember.getMember_id();
		String board_photo_1 = null;
		String board_photo_2 = null;
		String board_photo_3 = null;
		try {
			String creator = id;
			String board_business_name = mr.getParameter("board_business_name");
			String board_business_license_no = mr.getParameter("board_business_license_no");
			BigDecimal board_donation_amount = new BigDecimal(mr.getParameter("board_donation_amount"));
			String board_address = mr.getParameter("board_address");
			String board_content = mr.getParameter("board_content");
			
			board_photo_1 = URLEncoder.encode(mr.getFilesystemName("board_photo_1"), "utf-8").replace("+", " ");
			board_photo_2 = URLEncoder.encode(mr.getFilesystemName("board_photo_2"), "utf-8").replace("+", " ");
			board_photo_3 = URLEncoder.encode(mr.getFilesystemName("board_photo_3"), "utf-8").replace("+", " ");
			
			String board_loi = mr.getFilesystemName("board_loi");
			
			b.setBoard_creator(creator);
			b.setBoard_business_name(board_business_name);
			b.setBoard_business_license_no(board_business_license_no);
			b.setBoard_donation_amount(board_donation_amount);
			b.setBoard_address(board_address);
			b.setBoard_content(board_content);
			b.setBoard_photo_1(board_photo_1);
			b.setBoard_photo_2(board_photo_2);
			b.setBoard_photo_3(board_photo_3);
			b.setBoard_loi(board_loi);
			
			// 승인 : 1, 미승인 : 0 (처음 작성 시 미승인 상태로 입력되며, 관리자 승인 후 1로 변환되고 이후 게시판에는 승인된 글만 올라갈 예정)
			b.setBoard_approval(new BigDecimal(0));
			
			if (ss.getMapper(BoardMapper.class).create(b) == 1) {
				req.setAttribute("result", "Board Create Success");
			} else {
				req.setAttribute("result", "Board Create Failed");
				new File(path + "/" + URLDecoder.decode(board_photo_1, "utf-8")).delete();
				new File(path + "/" + URLDecoder.decode(board_photo_2, "utf-8")).delete();
				new File(path + "/" + URLDecoder.decode(board_photo_3, "utf-8")).delete();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Board Create Failed");
			try {
				new File(path + "/" + URLDecoder.decode(board_photo_1, "utf-8")).delete();
				new File(path + "/" + URLDecoder.decode(board_photo_2, "utf-8")).delete();
				new File(path + "/" + URLDecoder.decode(board_photo_3, "utf-8")).delete();
			} catch (UnsupportedEncodingException e1) {
			}
		}
	}
	
	public void decReqPost(HttpServletRequest req) {
		try {
			ma.setBoard_no(req.getParameter("no"));
			ma.setBoard_dec(req.getParameter("dec"));
			if (ma.getBoard_no() == null) {
				return;
			} else if (ma.getBoard_dec().equals("1")) {
				// 승인된 경우
				if (ss.getMapper(BoardMapper.class).decReqPost(ma) == 1) {
					req.setAttribute("result", "Managements(Board Decision) Success");
				} else {
					req.setAttribute("result", "Managements(Board Decision) Failed");				
				}
			} else {
				// 거절된 경우
				if (ss.getMapper(BoardMapper.class).delPost(ma) == 1) {
					req.setAttribute("result", "Managements(Board Decision) Success");
				} else {
					req.setAttribute("result", "Managements(Board Decision) Failed");				
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Managements(Board Decision) Failed");				
		}
	}
	
	public void delInitPost(HttpServletRequest req) {
		try {
			ma.setBoard_no(req.getParameter("no"));
			ma.setBoard_dec(req.getParameter("dec"));
			if (ss.getMapper(BoardMapper.class).delPost(ma) == 1) {
				req.setAttribute("result", "Managements(Delete) Success");
			} else {
				req.setAttribute("result", "Managements(Delete) Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Managements(Delete) Failed");
		}
	}
	
	public void editPost(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/boardPhoto");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 31457280,
					"utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Post Update Failed(Photo)");
			return;
		}
		
		Member user = (Member) req.getSession().getAttribute("loginMember");
		ManagementsAttr ma = new ManagementsAttr();
		ma.setBoard_no(mr.getParameter("board_no"));
		Board post = ss.getMapper(BoardMapper.class).selectPostOne(ma);
		
		if (!post.getBoard_creator().equals(user.getMember_id())) {
			req.setAttribute("result", "Post Update Failed");
			return;
		}
		
		try {
			
			String [] oldPhotos = {
					post.getBoard_photo_1(),
					post.getBoard_photo_2(),
					post.getBoard_photo_3(),
					post.getBoard_loi()
					};
			String [] newPhotos = {
					mr.getFilesystemName("board_photo_1"),
					mr.getFilesystemName("board_photo_2"),
					mr.getFilesystemName("board_photo_3"),
					mr.getFilesystemName("board_loi")
					};
			
			for (int i = 0; i < 4; i++) {
				if ((newPhotos[i] != null) && !oldPhotos[i].equals(newPhotos[i])) {
					newPhotos[i] = URLEncoder.encode(newPhotos[i], "utf-8").replace("+", " ");
					oldPhotos[i] = URLDecoder.decode(oldPhotos[i], "utf-8");
					new File(path + "/" + oldPhotos[i]).delete();
				} else if (oldPhotos[i].equals(newPhotos[i])) {
					newPhotos[i] = oldPhotos[i];
				}
			}

			post.setBoard_content(mr.getParameter("board_content"));
			post.setBoard_photo_1(newPhotos[0]);
			post.setBoard_photo_2(newPhotos[1]);
			post.setBoard_photo_3(newPhotos[2]);
			
			if (ss.getMapper(BoardMapper.class).editPost(post) == 1) {
				req.setAttribute("result", "Post Update Success");
			} else {
				req.setAttribute("result", "Post Update Failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "Post Update Failed");
		}
	}
	
	public void selectPostOne(HttpServletRequest req) {
		String no = req.getParameter("no");
		ma.setBoard_no(no);
		req.setAttribute("post", ss.getMapper(BoardMapper.class).selectPostOne(ma));
	}
	
	public void showReqPost(HttpServletRequest req) {
		req.setAttribute("reqPostList", ss.getMapper(BoardMapper.class).showReqPost());
	}
	
	public void showInitPost(int page, HttpServletRequest req) {
		try {
			setShowAllCount(new PageManager("", null, null)); // 추 후 삭제
			
			int perPage = ma.getBoardPerPage();
			int showCount = showAllCount;
			int start = (page - 1) * perPage + 1;
			int end = perPage * page;
			PageManager pm = new PageManager("", new BigDecimal(start), new BigDecimal(end));
			String keyword = (String) req.getSession().getAttribute("keyword");
			
			if (keyword != null) {
				pm.setKeyword(keyword);
				showCount = ss.getMapper(BoardMapper.class).showAllCount(pm);
			}
			
			req.setAttribute("initPostList", ss.getMapper(BoardMapper.class).showInitPost(pm));
			
			int pageCount = (int) Math.ceil(showCount / (double) perPage);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("page", page);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
