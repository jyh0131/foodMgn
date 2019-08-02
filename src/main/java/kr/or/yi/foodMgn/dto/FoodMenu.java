package kr.or.yi.foodMgn.dto;

public class FoodMenu {
	private int menuNo;
	private String menuKind;
	
	public FoodMenu() {
	}
	
	public FoodMenu(int menuNo) {
		this.menuNo = menuNo;
	}

	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public String getMenuKind() {
		return menuKind;
	}
	public void setMenuKind(String menuKind) {
		this.menuKind = menuKind;
	}
	
//	@Override
//	public int hashCode() {
//		final int prime = 31;
//		int result = 1;
//		result = prime * result + menuNo;
//		return result;
//	}
//
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		FoodMenu other = (FoodMenu) obj;
//		if (menuNo != other.menuNo)
//			return false;
//		return true;
//	}

	@Override
	public String toString() {
		return String.format("Menu [menuNo=%s, menuKind=%s]", menuNo, menuKind);
	}
	
}
