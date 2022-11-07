package org.aaronpark.donation.board;

import java.math.BigDecimal;

public class Board {
	private BigDecimal board_no;
	private String board_creator;
	private String board_business_name;
	private String board_business_license_no;
	private BigDecimal board_donation_amount;
	private String board_address;
	private String board_content;
	private String board_photo_1;
	private String board_photo_2;
	private String board_photo_3;
	private String board_loi;
	private BigDecimal board_approval;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(BigDecimal board_no, String board_creator, String board_business_name,
			String board_business_license_no, BigDecimal board_donation_amount, String board_address,
			String board_content, String board_photo_1, String board_photo_2, String board_photo_3, String board_loi, BigDecimal board_approval) {
		super();
		this.board_no = board_no;
		this.board_creator = board_creator;
		this.board_business_name = board_business_name;
		this.board_business_license_no = board_business_license_no;
		this.board_donation_amount = board_donation_amount;
		this.board_address = board_address;
		this.board_content = board_content;
		this.board_photo_1 = board_photo_1;
		this.board_photo_2 = board_photo_2;
		this.board_photo_3 = board_photo_3;
		this.board_loi = board_loi;
		this.board_approval = board_approval;
	}

	public BigDecimal getBoard_no() {
		return board_no;
	}

	public void setBoard_no(BigDecimal board_no) {
		this.board_no = board_no;
	}

	public String getBoard_creator() {
		return board_creator;
	}

	public void setBoard_creator(String board_creator) {
		this.board_creator = board_creator;
	}

	public String getBoard_business_name() {
		return board_business_name;
	}

	public void setBoard_business_name(String board_business_name) {
		this.board_business_name = board_business_name;
	}

	public String getBoard_business_license_no() {
		return board_business_license_no;
	}

	public void setBoard_business_license_no(String board_business_license_no) {
		this.board_business_license_no = board_business_license_no;
	}

	public BigDecimal getBoard_donation_amount() {
		return board_donation_amount;
	}

	public void setBoard_donation_amount(BigDecimal board_donation_amount) {
		this.board_donation_amount = board_donation_amount;
	}

	public String getBoard_address() {
		return board_address;
	}

	public void setBoard_address(String board_address) {
		this.board_address = board_address;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_photo_1() {
		return board_photo_1;
	}

	public void setBoard_photo_1(String board_photo_1) {
		this.board_photo_1 = board_photo_1;
	}

	public String getBoard_photo_2() {
		return board_photo_2;
	}
	
	public void setBoard_photo_2(String board_photo_2) {
		this.board_photo_2 = board_photo_2;
	}
	
	public String getBoard_photo_3() {
		return board_photo_3;
	}
	
	public void setBoard_photo_3(String board_photo_3) {
		this.board_photo_3 = board_photo_3;
	}

	public String getBoard_loi() {
		return board_loi;
	}

	public void setBoard_loi(String board_loi) {
		this.board_loi = board_loi;
	}

	public BigDecimal getBoard_approval() {
		return board_approval;
	}

	public void setBoard_approval(BigDecimal board_approval) {
		this.board_approval = board_approval;
	}
}
