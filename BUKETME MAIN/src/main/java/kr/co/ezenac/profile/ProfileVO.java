package kr.co.ezenac.profile;

import java.io.Serializable;

public class ProfileVO implements Serializable {
	private int profileRegisterNum;
	private int registerNum;
	private int memCode;
	private String profileImageName;
	private String profileName;
	
	public ProfileVO() {
		
	}
	
	public int getProfileRegisterNum() {
		return profileRegisterNum;
	}
	public void setProfileRegisterNum(int profileRegisterNum) {
		this.profileRegisterNum = profileRegisterNum;
	}
	public int getRegisterNum() {
		return registerNum;
	}
	public void setRegisterNum(int registerNum) {
		this.registerNum = registerNum;
	}
	public int getMemCode() {
		return memCode;
	}
	public void setMemCode(int memCode) {
		this.memCode = memCode;
	}
	public String getProfileImageName() {
		return profileImageName;
	}
	public void setProfileImageName(String profileImageName) {
		this.profileImageName = profileImageName;
	}
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	
	
}
