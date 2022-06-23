package kr.co.ezenac.videoRecord;

import java.io.Serializable;

public class VideoRecordVO implements Serializable {
	private int recordNum;
	private int profileRegisterNum;
	private int videoNum;
	private String videoSection;
	private String status;
	
	public VideoRecordVO() {
		
	}

	public int getRecordNum() {
		return recordNum;
	}

	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}

	public int getProfileRegisterNum() {
		return profileRegisterNum;
	}

	public void setProfileRegisterNum(int profileRegisterNum) {
		this.profileRegisterNum = profileRegisterNum;
	}

	public int getVideoNum() {
		return videoNum;
	}

	public void setVideoNum(int videoNum) {
		this.videoNum = videoNum;
	}

	public String getVideoSection() {
		return videoSection;
	}

	public void setVideoSection(String videoSection) {
		this.videoSection = videoSection;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
