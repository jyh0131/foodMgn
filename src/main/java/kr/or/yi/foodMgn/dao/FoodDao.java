package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.dto.FoodKind;

public interface FoodDao {
	public List<Food> selectFoodByAll();
	public int insertFood(Food food);
	public List<Food> selectByNo(Food food);
	public int updateFood(Food food);
	public int deletFood(Food food);
	public List<Food> selectByName(Map<String, Object> map);
	public Food selectByNames(Food food);
	public List<Food> selectFoodByAllF();
	public Food selectByFdNo(Food food);
	public List<Food> selectByFkNo(FoodKind fk);
	public List<Food> selectListPage(Map<String, Integer> map);
	public int selectTotalCount();
	public List<Food> selectByFkNo2(Map<String, Object> map);
	public List<Food> selectByNameAndFkNo(Map<String, Object> map);
}
