package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.Food;

public interface FoodDao {
	public List<Food> selectFoodByAll();
	public int insertFood(Food food);
	public List<Food> selectByNo(Food food);
	public int updateFood(Food food);
	public int deletFood(Food food);
	public List<Food> selectByName(Food food);
	public Food selectByNames(Food food);
	public List<Food> selectFoodByAllF();
	public Food selectByFdNo(Food food);
}
