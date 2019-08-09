package kr.or.yi.foodMgn.dto;

import java.util.Date;

public class Notice {
	private int noNo;
	private String noTitle;
	private String noContent;
	private int noReadNt;
	private String noWriter;
	private Date noRegdate;
	private Date noModdate;
	private boolean noDelete;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}
	
	public Notice(int noNo) {
		super();
		this.noNo = noNo;
	}

	public Notice(String noTitle, String noContent) {
		super();
		this.noTitle = noTitle;
		this.noContent = noContent;
	}

	public int getNoNo() {
		return noNo;
	}
	public void setNoNo(int noNo) {
		this.noNo = noNo;
	}
	public String getNoTitle() {
		return noTitle;
	}
	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}
	public String getNoContent() {
		return noContent;
	}
	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}
	public int getNoReadNt() {
		return noReadNt;
	}
	public void setNoReadNt(int noReadNt) {
		this.noReadNt = noReadNt;
	}
	public String getNoWriter() {
		return noWriter;
	}
	public void setNoWriter(String noWriter) {
		this.noWriter = noWriter;
	}
	public Date getNoRegdate() {
		return noRegdate;
	}
	public void setNoRegdate(Date noRegdate) {
		this.noRegdate = noRegdate;
	}
	public Date getNoModdate() {
		return noModdate;
	}
	public void setNoModdate(Date noModdate) {
		this.noModdate = noModdate;
	}
	public boolean isNoDelete() {
		return noDelete;
	}
	public void setNoDelete(boolean noDelete) {
		this.noDelete = noDelete;
	}

	@Override
	public String toString() {
		return "Notice [noNo=" + noNo + ", noTitle=" + noTitle + ", noContent=" + noContent + ", noReadNt=" + noReadNt
				+ ", noWriter=" + noWriter + ", noRegdate=" + noRegdate + ", noModdate=" + noModdate + ", noDelete="
				+ noDelete + "]";
	}

}
