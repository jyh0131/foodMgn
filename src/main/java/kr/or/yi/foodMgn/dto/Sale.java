package kr.or.yi.foodMgn.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Sale {
	private int no;
	private int saleNo;
	private Date saletime;
	private int saleOrderCnt;
	private boolean saleOrderKind;
	private int saleType;
	private Food fdNo;
	private Member mbNo;
	private String saleDiscountInfo;
	private int saleDiscountPrice;
	private boolean saleCancel;

	public Sale() {
	}

	public Sale(int saleNo, Date saletime, int saleOrderCnt, boolean saleOrderKind, int saleType, Food fdNo,
			Member mbNo, String saleDiscountInfo, int saleDiscountPrice, boolean saleCancel) {
		super();
		this.saleNo = saleNo;
		this.saletime = saletime;
		this.saleOrderCnt = saleOrderCnt;
		this.saleOrderKind = saleOrderKind;
		this.saleType = saleType;
		this.fdNo = fdNo;
		this.mbNo = mbNo;
		this.saleDiscountInfo = saleDiscountInfo;
		this.saleDiscountPrice = saleDiscountPrice;
		this.saleCancel = saleCancel;
	}

	public Sale(int no, int saleNo, Date saletime, int saleOrderCnt, boolean saleOrderKind, int saleType, Food fdNo,
			Member mbNo, String saleDiscountInfo, int saleDiscountPrice, boolean saleCancel) {
		super();
		this.no = no;
		this.saleNo = saleNo;
		this.saletime = saletime;
		this.saleOrderCnt = saleOrderCnt;
		this.saleOrderKind = saleOrderKind;
		this.saleType = saleType;
		this.fdNo = fdNo;
		this.mbNo = mbNo;
		this.saleDiscountInfo = saleDiscountInfo;
		this.saleDiscountPrice = saleDiscountPrice;
		this.saleCancel = saleCancel;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSaleNo() {
		return saleNo;
	}

	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}

	public Date getSaletime() {
		return saletime;
	}

	public void setSaletime(Date saletime) {
		this.saletime = saletime;
	}

	public int getSaleOrderCnt() {
		return saleOrderCnt;
	}

	public void setSaleOrderCnt(int saleOrderCnt) {
		this.saleOrderCnt = saleOrderCnt;
	}

	public boolean isSaleOrderKind() {
		return saleOrderKind;
	}

	public void setSaleOrderKind(boolean saleOrderKind) {
		this.saleOrderKind = saleOrderKind;
	}

	public int getSaleType() {
		return saleType;
	}

	public void setSaleType(int saleType) {
		this.saleType = saleType;
	}

	public Food getFdNo() {
		return fdNo;
	}

	public void setFdNo(Food fdNo) {
		this.fdNo = fdNo;
	}

	public Member getMbNo() {
		return mbNo;
	}

	public void setMbNo(Member mbNo) {
		this.mbNo = mbNo;
	}

	public String getSaleDiscountInfo() {
		return saleDiscountInfo;
	}

	public void setSaleDiscountInfo(String saleDiscountInfo) {
		this.saleDiscountInfo = saleDiscountInfo;
	}

	public int getSaleDiscountPrice() {
		return saleDiscountPrice;
	}

	public void setSaleDiscountPrice(int saleDiscountPrice) {
		this.saleDiscountPrice = saleDiscountPrice;
	}

	public boolean isSaleCancel() {
		return saleCancel;
	}

	public void setSaleCancel(boolean saleCancel) {
		this.saleCancel = saleCancel;
	}

	@Override
	public String toString() {
		return String.format(
				"Sale [no=%s, saleNo=%s, saletime=%s, saleOrderCnt=%s, saleOrderKind=%s, saleType=%s, fdNo=%s, mbNo=%s, saleDiscountInfo=%s, saleDiscountPrice=%s, saleCancel=%s]",
				no, saleNo, saletime, saleOrderCnt, saleOrderKind, saleType, fdNo, mbNo, saleDiscountInfo,
				saleDiscountPrice, saleCancel);
	}

	public String toString2() {
		return "판매번호 : " + saleNo + "수량" + saleOrderCnt + "종료" + saleOrderKind + "음식번호" + fdNo.getFdNo();
	}

	public Object[] toArray() {
		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");

		return new Object[] { no, saleNo, sDate.format(saletime), String.format("%d개", saleOrderCnt),
				saleType == 1 ? "현금" : "카드", fdNo.getFdName(), mbNo.getMbName() };
	}

}
