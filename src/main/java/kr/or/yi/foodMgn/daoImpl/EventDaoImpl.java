package kr.or.yi.foodMgn.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.dto.Event;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class EventDaoImpl implements EventDao {
	private String namespace = "kr.or.yi.foodMgn.dao.EventMapper";
	
	@Override
	public int insertEvent(Event event) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace + ".insertEvent", event);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<Event> selectListPage(Map<String, Integer> map) {
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
	public Event selectByNo(int no) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectByNo", no);
		}
	}

	@Override
	public int deleteEvent(int no) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace + ".deleteEvent", no);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateEvent(Event event) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateEvent", event);
			sqlSession.commit();
			return res;
		}
	}

}
