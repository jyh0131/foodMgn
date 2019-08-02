package kr.or.yi.foodMgn.daoImpl;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.ManagerDao;
import kr.or.yi.foodMgn.dto.Manager;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class ManagerDaoImpl implements ManagerDao {
	private String namespace = "kr.or.yi.foodMgn.dao.ManagerMapper";
	

	@Override
	public Manager selectByPass(Manager manager) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectOne(namespace+".selectByPass", manager);
		}
	}
}
