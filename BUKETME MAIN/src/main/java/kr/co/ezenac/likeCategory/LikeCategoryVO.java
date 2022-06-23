package kr.co.ezenac.likeCategory;

import java.io.Serializable;

public class LikeCategoryVO implements Serializable {
	private int likeCategoryNo;
	private String likeCategoryName;
	
	public LikeCategoryVO() {
		
	}

	public int getLikeCategoryNo() {
		return likeCategoryNo;
	}

	public void setLikeCategoryNo(int likeCategoryNo) {
		this.likeCategoryNo = likeCategoryNo;
	}

	public String getLikeCategoryName() {
		return likeCategoryName;
	}

	public void setLikeCategoryName(String likeCategoryName) {
		this.likeCategoryName = likeCategoryName;
	}
	
	
}
