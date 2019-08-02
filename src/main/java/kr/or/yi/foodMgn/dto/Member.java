package kr.or.yi.foodMgn.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Member {
	private int mbNo;
	private String mbName;
	private Date mbBirth;
	private String mbTel;
	private int mbMileage;
	private Grade mbGrade;
	private String mbAddress;
	private List<Coupon> coupon;
	private boolean mbWithdrawal;
	private Date mbJoin;
	private int mbCount;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int mbNo) {
		super();
		this.mbNo = mbNo;
	}
	
	
	public Member(String mbName, String mbTel) {
		this.mbName = mbName;
		this.mbTel = mbTel;
	}
	
	public Member(int mbNo, String mbName, Date mbBirth, String mbTel, int mbMileage, Grade mbGrade, String mbAddress, List<Coupon> coupon) {
		this.mbNo = mbNo;
		this.mbName = mbName;
		this.mbBirth = mbBirth;
		this.mbTel = mbTel;
		this.mbMileage = mbMileage;
		this.mbGrade = mbGrade;
		this.mbAddress = mbAddress;
		this.coupon = coupon;
	}

	public Member(int mbNo, String mbName, Date mbBirth, String mbTel, int mbMileage, Grade mbGrade, String mbAddress, List<Coupon> coupon, boolean mbWithdrawal) {
		this.mbNo = mbNo;
		this.mbName = mbName;
		this.mbBirth = mbBirth;
		this.mbTel = mbTel;
		this.mbMileage = mbMileage;
		this.mbGrade = mbGrade;
		this.mbAddress = mbAddress;
		this.coupon = coupon;
		this.mbWithdrawal = mbWithdrawal;
	}

	public Member(int mbNo, String mbName, Date mbBirth, String mbTel, String mbAddress, Grade mbGrade, int mbMileage) {
		this.mbNo = mbNo;
		this.mbName = mbName;
		this.mbBirth = mbBirth;
		this.mbTel = mbTel;
		this.mbAddress = mbAddress;
		this.mbGrade = mbGrade;
		this.mbMileage = mbMileage;
	}

	public Member(int mbNo, String mbName, String mbTel, boolean mbWithdrawal) {
		this.mbNo = mbNo;
		this.mbName = mbName;
		this.mbTel = mbTel;
		this.mbWithdrawal = mbWithdrawal;
	}

	public Member(int mbNo, String mbName, Date mbBirth, String mbTel, String mbAddress, Grade mbGrade, int mbMileage, List<Coupon> couponlist) {
		this.mbNo = mbNo;
		this.mbName = mbName;
		this.mbBirth = mbBirth;
		this.mbTel = mbTel;
		this.mbAddress = mbAddress;
		this.mbGrade = mbGrade;
		this.mbMileage = mbMileage;
		coupon = couponlist;
	}

	public int getMbNo() {
		return mbNo;
	}

	public void setMbNo(int mbNo) {
		this.mbNo = mbNo;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public Date getMbBirth() {
		return mbBirth;
	}

	public void setMbBirth(Date mbBirth) {
		this.mbBirth = mbBirth;
	}

	public String getMbTel() {
		return mbTel;
	}

	public void setMbTel(String mbTel) {
		this.mbTel = mbTel;
	}

	public int getMbMileage() {
		return mbMileage;
	}

	public void setMbMileage(int mbMileage) {
		this.mbMileage = mbMileage;
	}

	public Grade getMbGrade() {
		return mbGrade;
	}

	public void setMbGrade(Grade mbGrade) {
		this.mbGrade = mbGrade;
	}

	public String getMbAddress() {
		return mbAddress;
	}

	public void setMbAddress(String mbAddress) {
		this.mbAddress = mbAddress;
	}

	public List<Coupon> getCoupon() {
		return coupon;
	}

	public void setCoupon(List<Coupon> coupon) {
		this.coupon = coupon;
	}
	
	public boolean isMbWithdrawal() {
		return mbWithdrawal;
	}

	public void setMbWithdrawal(boolean mbWithdrawal) {
		this.mbWithdrawal = mbWithdrawal;
	}
	
	public int getMbCount() {
		return mbCount;
	}

	public void setMbCount(int mbCount) {
		this.mbCount = mbCount;
	}

	public Date getMbJoin() {
		return mbJoin;
	}

	public void setMbJoin(Date mbJoin) {
		this.mbJoin = mbJoin;
	}

	@Override
	public String toString() {
		final int maxLen = 10;
		return String.format(
				"Member [mbNo=%s, mbName=%s, mbBirth=%s, mbTel=%s, mbMileage=%s, mbGrade=%s, mbAddress=%s, coupon=%s, mbWithdrawal=%s, mbJoin=%s, mbCount=%s]",
				mbNo, mbName, mbBirth, mbTel, mbMileage, mbGrade, mbAddress,
				coupon != null ? coupon.subList(0, Math.min(coupon.size(), maxLen)) : null, mbWithdrawal, mbJoin,
				mbCount);
	}

	public Object[] toArray() {
		String[] array;
		if(coupon != null) {
			 array = new String[coupon.size()];
			for (int i = 0; i < coupon.size(); i++) {
				array[i] = coupon.get(i).toString();
			}
		}else {
			array = new String[] {""};
		}

		
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		String joinDate = "";
		if(mbJoin != null) {
			joinDate = sdfm.format(mbJoin);
		}


		if(mbBirth != null) {
			return new Object[]{String.format("M%03d", mbNo), mbName, String.format("%tF", mbBirth), mbTel, mbAddress, mbGrade, String.format("%,d원", mbMileage), ("".join(",", array)), mbWithdrawal?"YES":"NO", joinDate};
		}else 
			return new Object[]{String.format("N%03d", mbNo), mbName, "", mbTel, "", "", "", "", mbWithdrawal?"YES":"NO"};
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mbName == null) ? 0 : mbName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (mbName == null) {
			if (other.mbName != null)
				return false;
		} else if (!mbName.equals(other.mbName))
			return false;
		return true;
	}
	
	
}
