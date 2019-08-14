package kr.or.yi.foodMgn.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.SalesStatusDao;
import kr.or.yi.foodMgn.dto.SalesStatus;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class SalesStatusDaoImpl implements SalesStatusDao {
	private String namespace = "kr.or.yi.foodMgn.dao.SalesStatusMapper.";
	@Override
	public List<SalesStatus> selectSalesStatusByAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectSalesStatusByAll");
		}
	}

	@Override
	public List<SalesStatus> selectSalesStatusByDate(String date) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectSalesStatusByDate",date);
		}
	}

	@Override
	public List<SalesStatus> selectSalesStatusByDateRange(Map<String, Object> map) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectSalesStatusByDateRange",map);
		}
	}

}
