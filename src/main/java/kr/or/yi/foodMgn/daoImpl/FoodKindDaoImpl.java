package kr.or.yi.foodMgn.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.FoodKindDao;
import kr.or.yi.foodMgn.dto.FoodKind;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;


public class FoodKindDaoImpl implements FoodKindDao {
	private String namespace = "kr.or.yi.foodMgn.dao.FoodKindMapper";
	
	@Override
	public List<FoodKind> selectByNo(FoodKind foodkind) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace+".selectByNo", foodkind);
		}
	}

	@Override
	public List<FoodKind> selectFoodKindByAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace+".selectFoodKindByAll");
		}
	}

	@Override
	public FoodKind selectByFkNo(FoodKind foodkind) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectOne(namespace+".selectByFkNo", foodkind);
		}
	}

}
