package kr.co.ezenac.membership;

import java.io.Serializable;

public class MembershipVO implements Serializable {
	private int memCode;
	private String membership;
	private int sameWatch;
	private int price;
	
	public MembershipVO() {
		
	}
	
	public int getMemCode() {
		return memCode;
	}
	public void setMemCode(int memCode) {
		this.memCode = memCode;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public int getSameWatch() {
		return sameWatch;
	}
	public void setSameWatch(int sameWatch) {
		this.sameWatch = sameWatch;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
