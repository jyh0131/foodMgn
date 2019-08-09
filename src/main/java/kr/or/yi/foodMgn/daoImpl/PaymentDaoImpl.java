package kr.or.yi.foodMgn.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.PaymentDao;
import kr.or.yi.foodMgn.dto.Payment;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class PaymentDaoImpl implements PaymentDao {
	private String namespace = "kr.or.yi.foodMgn.dao.PaymentMapper.";
	@Override
	public List<Payment> selectPaymentByAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectPaymentByAll");
		}
	}

	@Override
	public List<Payment> selectPaymentByDate(String date) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectPaymentByDate",date);
		}
	}

	

	@Override
	public List<Payment> selectPaymentByDate2(Map<String, Object> map) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectPaymentByDate2",map);
		}
	}

	@Override
	public List<Payment> selectPaymentByAll2(int no) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + "selectPaymentByAll2",no);
		}
	}

}
