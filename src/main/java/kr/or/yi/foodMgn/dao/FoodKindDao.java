package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.FoodKind;

public interface FoodKindDao {
	public List<FoodKind> selectByNo(FoodKind foodkind);
	public List<FoodKind> selectFoodKindByAll();
	public FoodKind selectByFkNo(FoodKind foodkind);
}
