package kr.co.ezenac.likeMedia;

import java.io.Serializable;

public class LikeMediaVO implements Serializable {
	private int profileRegisterNum;
	private String categoryNo;
	private String likeCategoryNo;
	private String personalBadContents;
	
	public LikeMediaVO() {
		
	}

	public int getProfileRegisterNum() {
		return profileRegisterNum;
	}

	public void setProfileRegisterNum(int profileRegisterNum) {
		this.profileRegisterNum = profileRegisterNum;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getLikeCategoryNo() {
		return likeCategoryNo;
	}

	public void setLikeCategoryNo(String likeCategoryNo) {
		this.likeCategoryNo = likeCategoryNo;
	}

	public String getPersonalBadContents() {
		return personalBadContents;
	}

	public void setPersonalBadContents(String personalBadContents) {
		this.personalBadContents = personalBadContents;
	}
	
	
}
