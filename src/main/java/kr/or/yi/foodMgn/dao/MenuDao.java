package kr.or.yi.foodMgn.dao;

import kr.or.yi.foodMgn.dto.FoodMenu;

public interface MenuDao {
	public FoodMenu selectByNo(FoodMenu menu);
}
