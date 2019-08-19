package kr.or.yi.foodMgn.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao {
	private String namespace = "kr.or.yi.foodMgn.dao.MemberMapper";
	
	@Override
	public List<Member> selectMemberByAll() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectMemberByAll");
		}
	}

	@Override
	public int insertMember(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace + ".insertMember", member);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<Member> selectMemberByTel(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectMemberByTel", member);
		}
	}

	@Override
	public int updateMember(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateMember", member);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteMember(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace + ".deleteMember", member);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<Member> selectMemberByNo(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectMemberByNo", member);
		}
	}

	@Override
	public Member selectByTel(int tel) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectByTel", tel);
		}
	}

	@Override
	public int mileageUpdate(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".mileageUpdate", member);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int couponDelete(Map<String, Object> map) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace + ".couponDelete", map);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public Member selectByNameTel(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectByNameTel", member);
		}
	}

	@Override
	public List<Member> selectMemberByAllNM() {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectMemberByAllNM");
		}
	}

	@Override
	public int updateTrnasMember(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateTrnasMember", member);
			sqlSession.commit();
			return res;
		}
	}

	@Override	
	public int updateGrade(Member mem) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateGrade", mem);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public Member selectCouponByTel(int tel) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectCouponByTel",tel);
		}
	}
	
	@Override
	public Member selectByMbNo(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectByMbNo",member);
		}
	}
	@Override
	public Member selectByMbNo2(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectByMbNo2",member);
		}
	}

	@Override
	public Member selectByTelForJoin(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectByTelForJoin",member);
		}
	}

	@Override
	public List<Member> selectListPage(Map<String, Integer> map) {
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
	public int myPageUpdate(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".myPageUpdate", member);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int insertCoupon(Map<String, Object> map) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace + ".insertCoupon", map);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<Member> selectCpname(Map<String, Object> map) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectCpname", map);
		}
	}

	@Override
	public int updateMileage(Member member) {
		try(SqlSession sqlSession = MybatisSqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateMileage", member);
			sqlSession.commit();
			return res;
		}
	}

}
