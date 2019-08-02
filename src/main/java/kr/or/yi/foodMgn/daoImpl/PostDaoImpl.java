package kr.or.yi.foodMgn.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.PostDao;
import kr.or.yi.foodMgn.dto.Post;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class PostDaoImpl implements PostDao {
	private String namespace = "kr.or.yi.foodMgn.dao.PostMapper";
	
	@Override
	public List<Post> selectBySiGunGu(Post post) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectBySiGunGu", post);
		}
	}

	@Override
	public List<Post> selectByDoro(Post post) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectByDoro", post);
		}
	}

	@Override
	public List<Post> selectBySiGunGuDoroAddr1(Post post) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectBySiGunGuDoroAddr1", post);
		}
	}

	@Override
	public List<Post> selectBySiGunGuDoroAddr1Addr2(Post post) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectBySiGunGuDoroAddr1Addr2", post);
		}
	}
}
