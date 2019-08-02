package kr.or.yi.foodMgn.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.CouponDao;
import kr.or.yi.foodMgn.dto.Coupon;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class CouponDaoImpl implements CouponDao {
	private String namespace = "kr.or.yi.foodMgn.dao.CouponMapper";
	
	@Override
	public List<Coupon> selectByCouponAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectByCouponAll");
		}
	}

}
