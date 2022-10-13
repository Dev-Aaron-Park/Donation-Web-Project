package org.aaronpark.donation.member;

public class Member {
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_photo;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String member_id, String member_pw, String member_email, String member_photo) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_email = member_email;
		this.member_photo = member_photo;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_photo() {
		return member_photo;
	}

	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
}
