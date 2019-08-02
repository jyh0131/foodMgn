package kr.or.yi.foodMgn.daoImpl;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.MenuDao;
import kr.or.yi.foodMgn.dto.FoodMenu;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class MenuDaoImpl implements MenuDao {
	private String namespace = "kr.or.yi.foodMgn.dao.MenuMapper";

	@Override
	public FoodMenu selectByNo(FoodMenu menu) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectOne(namespace+".selectByNo", menu);
		}
	}
}
