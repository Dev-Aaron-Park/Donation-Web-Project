package org.aaronpark.donation.member;

public interface MemberMapper {
	public abstract int signup(Member m);
	
	public abstract Member getMemberByID(Member m);
	
	public abstract int edit(Member m);
}
