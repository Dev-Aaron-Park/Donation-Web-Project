package org.aaronpark.donation.board;

import java.util.List;

import org.aaronpark.donation.ManagementsAttr;

public interface BoardMapper {
	public abstract int create(Board b);
	
	public abstract int decReqPost(ManagementsAttr ma);
	
	public abstract int delPost(ManagementsAttr ma);
	
	public abstract Board selectPostOne(ManagementsAttr ma);
	
	public abstract List<Board> showReqPost();
	
	public abstract List<Board> showInitPost();
	
}
