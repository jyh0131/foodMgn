package kr.or.yi.foodMgn.dto;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

public class Food {
	private int fdNo;
	private int fdPrice;
	private String fdName;
	private FoodKind fkNo;
	private boolean fdWithdrawal;
	private String fdImg;
	
	private int count = 1;
	
	public static NumberFormat formatter = new DecimalFormat("###,###");
	
	public Food() {
		// TODO Auto-generated constructor stub
	}
	
	public Food(FoodKind fkNo) {
		this.fkNo = fkNo;
	}

	public Food(int fdNo) {
		this.fdNo = fdNo;
	}
	
	public Food(int fdNo, int fdPrice, String fdName, FoodKind fkNo) {
		this.fdNo = fdNo;
		this.fdPrice = fdPrice;
		this.fdName = fdName;
		this.fkNo = fkNo;
	}
	
	public Food(int fdPrice, String fdName, FoodKind fkNo) {
		super();
		this.fdPrice = fdPrice;
		this.fdName = fdName;
		this.fkNo = fkNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void plusCount() {
		this.count+=1;
	}
	
	public void minusCount() {
		this.count-=1;
	}

	public int getFdNo() {
		return fdNo;
	}

	public void setFdNo(int fdNo) {
		this.fdNo = fdNo;
	}

	public int getFdPrice() {
		return fdPrice;
	}

	public void setFdPrice(int fdPrice) {
		this.fdPrice = fdPrice;
	}

	public String getFdName() {
		return fdName;
	}

	public void setFdName(String fdName) {
		this.fdName = fdName;
	}

	public FoodKind getFkNo() {
		return fkNo;
	}

	public void setFkNo(FoodKind fkNo) {
		this.fkNo = fkNo;
	}
	
	public boolean isFdWithdrawal() {
		return fdWithdrawal;
	}

	public void setFdWithdrawal(boolean fdWithdrawal) {
		this.fdWithdrawal = fdWithdrawal;
	}
	
	public String getFdImg() {
		return fdImg;
	}

	public void setFdImg(String fdImg) {
		this.fdImg = fdImg;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fdName == null) ? 0 : fdName.hashCode());
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
		Food other = (Food) obj;
		if (fdName == null) {
			if (other.fdName != null)
				return false;
		} else if (!fdName.equals(other.fdName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("Food [fdNo=%s, fdPrice=%s, fdName=%s, fkNo=%s, count=%s]", fdNo, fdPrice, fdName, fkNo, count);
	}

	public String toString2() {
		return fdName+"   "+formatter.format(fdPrice*count)+"원";
	}
	
	public Object[] toArray() {
		String price = formatter.format(this.fdPrice);
		String total = formatter.format(this.fdPrice*this.count);
		return new Object[]{fdName, price+"원", count, total+"원" };
	}

	public Object[] toArray2() {
		return new Object[]{fkNo.getFkName(), String.format("F%03d", fdNo), fdName, String.format("%,d", fdPrice)};
	}
	
}
