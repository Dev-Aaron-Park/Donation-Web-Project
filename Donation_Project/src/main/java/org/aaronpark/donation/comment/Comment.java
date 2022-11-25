package org.aaronpark.donation.comment;

import java.math.BigDecimal;
import java.util.Date;

public class Comment {
	private BigDecimal comment_no;
	private BigDecimal comment_board_no;
	private String comment_member;
	private Date comment_date;
	private String comment_text;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(BigDecimal comment_no, BigDecimal comment_board_no, String comment_member, Date comment_date,
			String comment_text) {
		super();
		this.comment_no = comment_no;
		this.comment_board_no = comment_board_no;
		this.comment_member = comment_member;
		this.comment_date = comment_date;
		this.comment_text = comment_text;
	}

	public BigDecimal getComment_no() {
		return comment_no;
	}

	public void setComment_no(BigDecimal comment_no) {
		this.comment_no = comment_no;
	}

	public BigDecimal getComment_board_no() {
		return comment_board_no;
	}

	public void setComment_board_no(BigDecimal comment_board_no) {
		this.comment_board_no = comment_board_no;
	}

	public String getComment_member() {
		return comment_member;
	}

	public void setComment_member(String comment_member) {
		this.comment_member = comment_member;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
}
