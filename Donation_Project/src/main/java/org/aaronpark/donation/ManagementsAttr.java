package org.aaronpark.donation;

public class ManagementsAttr {
	private String board_no;
	private String board_dec;
	
	public ManagementsAttr() {
		// TODO Auto-generated constructor stub
	}

	public ManagementsAttr(String board_no, String board_dec) {
		super();
		this.board_no = board_no;
		this.board_dec = board_dec;
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getBoard_dec() {
		return board_dec;
	}

	public void setBoard_dec(String board_dec) {
		this.board_dec = board_dec;
	}
}
