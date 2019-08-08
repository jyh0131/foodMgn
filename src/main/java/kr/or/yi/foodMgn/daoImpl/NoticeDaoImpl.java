package kr.or.yi.foodMgn.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.dto.Notice;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class NoticeDaoImpl implements NoticeDao {
	private String namespace = "kr.or.yi.foodMgn.dao.NoticeMapper";
	
	@Override
	public List<Notice> selectNoticeByAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectNoticeByAll");
		}
	}

	@Override
	public int insertNotice(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace + ".insertNotice", notice);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public Notice selectNoticeByNo(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectNoticeByNo", notice);
		}
	}

	@Override
	public List<Notice> selectNoticeByAll2() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectNoticeByAll2");
		}
	}

	@Override
	public List<Notice> selectListPage(int startrow, int size) {
		// TODO Auto-generated method stub
		return null;
	}

}
