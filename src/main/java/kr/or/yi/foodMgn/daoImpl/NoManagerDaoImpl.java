package kr.or.yi.foodMgn.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.NoManagerDao;
import kr.or.yi.foodMgn.dto.NoManager;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class NoManagerDaoImpl implements NoManagerDao {
	private String namespace = "kr.or.yi.foodMgn.dao.NoManagerMapper";


	@Override
	public NoManager selectByPass(NoManager noManager) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectOne(namespace+".selectByPass", noManager);
		}
	}

	@Override
	public int insertNoManger(NoManager noManager) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace+".insertNoManger", noManager);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<NoManager> selectByAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace+".selectByAll");
		}
	}

	@Override
	public NoManager selectById(NoManager noManager) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()){
			return sqlSession.selectOne(namespace+".selectById", noManager);
		}
	}
}
