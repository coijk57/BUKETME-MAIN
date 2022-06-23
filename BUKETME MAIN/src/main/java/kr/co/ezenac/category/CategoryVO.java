package kr.co.ezenac.category;

import java.io.Serializable;

public class CategoryVO implements Serializable {
	private int categoryNo;
	private String categoryName;
	
	public CategoryVO() {
		
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}
