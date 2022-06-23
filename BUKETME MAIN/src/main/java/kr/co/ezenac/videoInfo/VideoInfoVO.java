package kr.co.ezenac.videoInfo;

import java.io.Serializable;
import java.util.Date;

public class VideoInfoVO implements Serializable {
	private int videoNum;
	private String title;
	private String contents;
	private String categoryNo;
	private String likeCategoryNo;
	private String imageFileName;
	private String videoFileName;
	private String ageLimit;
	private Date openDate;
	private Date postDate;
	private int videoHits;
	private String actors;
	private String director;
	
	public VideoInfoVO() {
		
	}
	
	public int getVideoNum() {
		return videoNum;
	}
	public void setVideoNum(int videoNum) {
		this.videoNum = videoNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getVideoFileName() {
		return videoFileName;
	}
	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}
	public String getAgeLimit() {
		return ageLimit;
	}
	public void setAgeLimit(String ageLimit) {
		this.ageLimit = ageLimit;
	}
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public int getVideoHits() {
		return videoHits;
	}
	public void setVideoHits(int videoHits) {
		this.videoHits = videoHits;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
}
