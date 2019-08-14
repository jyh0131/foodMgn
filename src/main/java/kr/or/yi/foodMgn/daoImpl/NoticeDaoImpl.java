package kr.or.yi.foodMgn.daoImpl;

import java.util.List;
import java.util.Map;

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
	public List<Notice> selectListPage(Map<String, Integer> map) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectListPage", map);
		}
	}

	@Override
	public int selectTotalCount() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.selectOne(namespace + ".selectTotalCount");
			return res;
		}
	}

	@Override
	public int updateReadNt(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateReadNt", notice);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteNotice(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace + ".deleteNotice", notice);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateNotice(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateNotice", notice);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<Notice> selectNoticeByTitle(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectNoticeByTitle", notice);
		}
	}

	@Override
	public List<Notice> selectNoticeByContent(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectNoticeByContent", notice);
		}
	}

	@Override
	public List<Notice> selectNoticeByTitleandContent(Notice notice) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectNoticeByTitleandContent", notice);
		}
	}

	@Override
	public List<Notice> selectFour() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectFour");
		}
	}

	

}
