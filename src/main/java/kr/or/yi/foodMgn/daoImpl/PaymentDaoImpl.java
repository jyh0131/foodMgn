package kr.or.yi.foodMgn.daoImpl;

import java.util.List;

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

}
