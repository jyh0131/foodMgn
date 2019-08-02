package kr.or.yi.foodMgn.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class FoodDaoImpl implements FoodDao {
	private String namespace = "kr.or.yi.foodMgn.dao.FoodMapper";
	
	@Override
	public List<Food> selectFoodByAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectFoodByAll");
		}
	}
	
	@Override
	public int insertFood(Food food) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			sqlSession.insert(namespace + ".insertFood", food);
			sqlSession.commit();
			return food.getFdNo();
		}
	}

	@Override
	public List<Food> selectByNo(Food food) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectByNo", food);
		}
	}

	@Override
	public int updateFood(Food food) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateFood", food);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deletFood(Food food) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace + ".deletFood", food);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<Food> selectByName(Food food) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectByName", food);
		}
	}

	@Override
	public Food selectByNames(Food food) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectByNames", food);
		}
	}

	@Override
	public List<Food> selectFoodByAllF() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectFoodByAllF");
		}
	}
	
}
