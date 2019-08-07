package kr.or.yi.foodMgn.dto;

public class Grade {
	private String grade;
	private int gDiscount;
	
	public Grade() {
		// TODO Auto-generated constructor stub
	}
	
	public Grade(String grade) {
		this.grade = grade;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	

	public int getgDiscount() {
		return gDiscount;
	}

	public void setgDiscount(int gDiscount) {
		this.gDiscount = gDiscount;
	}

	@Override
	public String toString() {
		return String.format("%s", grade);
	}
}
