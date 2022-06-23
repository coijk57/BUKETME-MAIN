package kr.co.ezenac.userManage;

import java.io.Serializable;
import java.util.Date;

public class UserManageVO implements Serializable {
	private int registerNum;
	private Date available_date;
	private String subscriptionstatus;
	
	
	public int getRegisterNum() {
		return registerNum;
	}
	public void setRegisterNum(int registerNum) {
		this.registerNum = registerNum;
	}
	public Date getAvailable_date() {
		return available_date;
	}
	public void setAvailable_date(Date available_date) {
		this.available_date = available_date;
	}
	public String getSubscriptionstatus() {
		return subscriptionstatus;
	}
	public void setSubscriptionstatus(String subscriptionstatus) {
		this.subscriptionstatus = subscriptionstatus;
	}
}
