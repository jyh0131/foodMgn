package kr.or.yi.foodMgn.dto;

public class MemberCoupon {
	private Coupon cpNo;
	private Member mbNo;
	private boolean cpUse;
	
	public MemberCoupon() {
	}

	public MemberCoupon(Coupon cpNo, Member mbNo) {
		this.cpNo = cpNo;
		this.mbNo = mbNo;
	}

	public Coupon getCpNo() {
		return cpNo;
	}

	public void setCpNo(Coupon cpNo) {
		this.cpNo = cpNo;
	}

	public Member getMbNo() {
		return mbNo;
	}

	public void setMbNo(Member mbNo) {
		this.mbNo = mbNo;
	}

	public boolean isCpUse() {
		return cpUse;
	}

	public void setCpUse(boolean cpUse) {
		this.cpUse = cpUse;
	}

	@Override
	public String toString() {
		return String.format("MemberCoupon [cpNo=%s, mbNo=%s, cpUse=%s]", cpNo, mbNo, cpUse);
	}
}
