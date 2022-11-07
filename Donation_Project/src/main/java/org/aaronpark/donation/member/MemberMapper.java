package org.aaronpark.donation.member;

import java.util.List;

public interface MemberMapper {
	public abstract int edit(Member m);
	
	public abstract List<Member> getAdminMember();
	
	public abstract List<Member> getNormalMember();
	
	public abstract Member getMemberByID(Member m);
	
	public abstract int memberAddAdmin(Member m);
	
	public abstract int memberPermChange(Member m);
	
	public abstract int signup(Member m);
}
