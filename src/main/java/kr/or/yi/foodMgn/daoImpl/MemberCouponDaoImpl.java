package kr.or.yi.foodMgn.daoImpl;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.MemberCouponDao;
import kr.or.yi.foodMgn.dto.MemberCoupon;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class MemberCouponDaoImpl implements MemberCouponDao {
	private String namespace = "kr.or.yi.foodMgn.dao.MemberCouponMapper";

	@Override
	public int insertMemberCoupon(MemberCoupon memberCoupon) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace + ".insertMemberCoupon", memberCoupon);
			sqlSession.commit();
			return res;
		}
	}

}
