package kr.or.yi.foodMgn.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Payment {
	private int payNo;
	private Date payTime;
	private String payMenu;
	private int payPrice;
	private int payType;
	private String payMember;
	private String payDiscountInfo;
	private int payDiscountPrice;
	private int payCancel;
	private int payMemberNo;
	private int payOrderKind;

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payment(int payNo, Date payTime, String payMenu, int payPrice, int payType, String payMember,
			String payDiscountInfo, int payDiscountPrice) {
		super();
		this.payNo = payNo;
		this.payTime = payTime;
		this.payMenu = payMenu;
		this.payPrice = payPrice;
		this.payType = payType;
		this.payMember = payMember;
		this.payDiscountInfo = payDiscountInfo;
		this.payDiscountPrice = payDiscountPrice;
	}
	
	
	
	
		
	public Payment(int payNo, Date payTime, String payMenu, int payPrice, int payType, String payMember,
			String payDiscountInfo, int payDiscountPrice, int payCancel) {
		super();
		this.payNo = payNo;
		this.payTime = payTime;
		this.payMenu = payMenu;
		this.payPrice = payPrice;
		this.payType = payType;
		this.payMember = payMember;
		this.payDiscountInfo = payDiscountInfo;
		this.payDiscountPrice = payDiscountPrice;
		this.payCancel = payCancel;
	}
	
	

	public Payment(int payNo, Date payTime, String payMenu, int payPrice, int payType, String payMember,
			String payDiscountInfo, int payDiscountPrice, int payCancel, int payMemberNo, int payOrderKind) {
		super();
		this.payNo = payNo;
		this.payTime = payTime;
		this.payMenu = payMenu;
		this.payPrice = payPrice;
		this.payType = payType;
		this.payMember = payMember;
		this.payDiscountInfo = payDiscountInfo;
		this.payDiscountPrice = payDiscountPrice;
		this.payCancel = payCancel;
		this.payMemberNo = payMemberNo;
		this.payOrderKind = payOrderKind;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public String getPayMenu() {
		return payMenu;
	}

	public void setPayMenu(String payMenu) {
		this.payMenu = payMenu;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public String getPayMember() {
		return payMember;
	}

	public void setPayMember(String payMember) {
		this.payMember = payMember;
	}

	public String getPayDiscountInfo() {
		return payDiscountInfo;
	}

	public void setPayDiscountInfo(String payDiscountInfo) {
		this.payDiscountInfo = payDiscountInfo;
	}

	public int getPayDiscountPrice() {
		return payDiscountPrice;
	}

	public void setPayDiscountPrice(int payDiscountPrice) {
		this.payDiscountPrice = payDiscountPrice;
	}
	
	

	public int getPayCancel() {
		return payCancel;
	}

	public void setPayCancel(int payCancel) {
		this.payCancel = payCancel;
	}

	

	public int getPayMemberNo() {
		return payMemberNo;
	}

	public void setPayMemberNo(int payMemberNo) {
		this.payMemberNo = payMemberNo;
	}



	@Override
	public String toString() {
		return String.format(
				"Payment [payNo=%s, payTime=%s, payMenu=%s, payPrice=%s, payType=%s, payMember=%s, payDiscountInfo=%s, payDiscountPrice=%s, payCancel=%s, payMemberNo=%s]",
				payNo, payTime, payMenu, payPrice, payType, payMember, payDiscountInfo, payDiscountPrice, payCancel,
				payMemberNo);
	}

	public Object[] toArray() {
		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return new Object[] { payNo, sDate.format(payTime), payMenu,String.format("%,d원", payPrice) , payDiscountInfo, String.format("%,d원", payDiscountPrice),
				payType == 1 ? "현금" : "카드", payMember ,payCancel==0?"결제완료":"취소"};
	}

	public int getPayOrderKind() {
		return payOrderKind;
	}

	public void setPayOrderKind(int payOrderKind) {
		this.payOrderKind = payOrderKind;
	}

}
