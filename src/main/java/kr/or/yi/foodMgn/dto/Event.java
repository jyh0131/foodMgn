package kr.or.yi.foodMgn.dto;

import java.util.Date;

public class Event {
	private int eNo;
	private String eName;
	private String eTitle;
	private String eText;
	private Date eStartDate;
	private Date eEndDate;
	private boolean eIng;
	
	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Event(String eName, String eTitle, String eText, Date eStartDate, Date eEndDate, boolean eIng) {
		super();
		this.eName = eName;
		this.eTitle = eTitle;
		this.eText = eText;
		this.eStartDate = eStartDate;
		this.eEndDate = eEndDate;
		this.eIng = eIng;
	}



	public Event(int eNo, String eName, String eTitle, String eText, Date eStartDate, Date eEndDate, boolean eIng) {
		super();
		this.eNo = eNo;
		this.eName = eName;
		this.eTitle = eTitle;
		this.eText = eText;
		this.eStartDate = eStartDate;
		this.eEndDate = eEndDate;
		this.eIng = eIng;
	}



	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String geteTitle() {
		return eTitle;
	}
	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}
	public String geteText() {
		return eText;
	}
	public void seteText(String eText) {
		this.eText = eText;
	}
	public Date geteStartDate() {
		return eStartDate;
	}
	public void seteStartDate(Date eStartDate) {
		this.eStartDate = eStartDate;
	}
	public Date geteEndDate() {
		return eEndDate;
	}
	public void seteEndDate(Date eEndDate) {
		this.eEndDate = eEndDate;
	}
	public boolean iseIng() {
		return eIng;
	}
	public void seteIng(boolean eIng) {
		this.eIng = eIng;
	}

	@Override
	public String toString() {
		return "Event [eNo=" + eNo + ", eName=" + eName + ", eTitle=" + eTitle + ", eText=" + eText + ", eStartDate="
				+ eStartDate + ", eEndDate=" + eEndDate + ", eIng=" + eIng + "]";
	}
	
	
}
