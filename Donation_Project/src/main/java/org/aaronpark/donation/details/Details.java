package org.aaronpark.donation.details;

import java.math.BigDecimal;

public class Details {
	private BigDecimal detail_no;
	private String detail_member;
	private BigDecimal detail_post;
	private BigDecimal detail_amount;
	
	public Details() {
		// TODO Auto-generated constructor stub
	}

	public Details(BigDecimal detail_no, String detail_member, BigDecimal detail_post, BigDecimal detail_amount) {
		super();
		this.detail_no = detail_no;
		this.detail_member = detail_member;
		this.detail_post = detail_post;
		this.detail_amount = detail_amount;
	}

	public BigDecimal getDetail_no() {
		return detail_no;
	}

	public void setDetail_no(BigDecimal detail_no) {
		this.detail_no = detail_no;
	}

	public String getDetail_member() {
		return detail_member;
	}

	public void setDetail_member(String detail_member) {
		this.detail_member = detail_member;
	}

	public BigDecimal getDetail_post() {
		return detail_post;
	}

	public void setDetail_post(BigDecimal detail_post) {
		this.detail_post = detail_post;
	}

	public BigDecimal getDetail_amount() {
		return detail_amount;
	}

	public void setDetail_amount(BigDecimal detail_amount) {
		this.detail_amount = detail_amount;
	}
}
