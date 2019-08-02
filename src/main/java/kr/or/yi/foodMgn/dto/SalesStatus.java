package kr.or.yi.foodMgn.dto;

import java.text.SimpleDateFormat;

public class SalesStatus {
	private int ssNo;
	private String ssName;
	private int ssCount;
	private int ssTotalPrice;
	private String ssShare;

	public SalesStatus() {
		super();
	}

	public SalesStatus(int ssNo, String ssName, int ssCount, int ssTotalPrice, String ssShare) {
		super();
		this.ssNo = ssNo;
		this.ssName = ssName;
		this.ssCount = ssCount;
		this.ssTotalPrice = ssTotalPrice;
		this.ssShare = ssShare;
	}

	public int getSsNo() {
		return ssNo;
	}

	public void setSsNo(int ssNo) {
		this.ssNo = ssNo;
	}

	public String getSsName() {
		return ssName;
	}

	public void setSsName(String ssName) {
		this.ssName = ssName;
	}

	public int getSsCount() {
		return ssCount;
	}

	public void setSsCount(int ssCount) {
		this.ssCount = ssCount;
	}

	public int getSsTotalPrice() {
		return ssTotalPrice;
	}

	public void setSsTotalPrice(int ssTotalPrice) {
		this.ssTotalPrice = ssTotalPrice;
	}

	public String getSsShare() {
		return ssShare;
	}

	public void setSsShare(String ssShare) {
		this.ssShare = ssShare;
	}
	
	



	@Override
	public String toString() {
		return String.format("SalesStatus [ssNo=%s, ssName=%s, ssCount=%s, ssTotalPrice=%s, ssShare=%s]", ssNo, ssName,
				ssCount, ssTotalPrice, ssShare);
	}

	public Object[] toArray() {

		return new Object[] { ssNo, ssName, String.format("%d개", ssCount), String.format("%,d원", ssTotalPrice), String.format("%s%%", ssShare) };
	}

}
