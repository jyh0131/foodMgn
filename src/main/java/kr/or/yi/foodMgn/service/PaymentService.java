package kr.or.yi.foodMgn.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.dao.SaleDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.daoImpl.SaleDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Sale;
import kr.or.yi.foodMgn.jdbc.MybatisSqlSessionFactory;

public class PaymentService {
	private static PaymentService service = new PaymentService();
	private String namespace = "kr.or.yi.foodMgn.dao.SaleMapper.";
	private String namespace2 = "kr.or.yi.foodMgn.dao.MemberMapper.";
	
	private SaleDao sDao;
	private MemberDao mDao;
	
	
	public static PaymentService getInstance() {
		return service;
	}

	public PaymentService() {
		sDao = new SaleDaoImpl();
		mDao = new MemberDaoImpl();
	}
	
	public Member selectByTel(int number) {
		return mDao.selectByTel(number);
	}
	
	public int insertSale(Map<String, List<Sale>> map) {
		return sDao.insertSale(map);
	}
	
	public int totalPrice(int number) {
		return sDao.totalPrice(number);
	}
	
	public int updateGrade(Member mem) {
		return mDao.updateGrade(mem);
	}
	
	public Member selectCouponByTel(int tel){
		return mDao.selectCouponByTel(tel);
	}
	

	
	public void insertSaleUpdateMileageTransaciton(Map<String, List<Sale>> map,Member member) {
		int resInsert = 0;
		int resUpdate = 0;
		SqlSession sqlSession = MybatisSqlSessionFactory.openSession();
		try {
			resInsert += sqlSession.insert(namespace + "insertSale", map);
			resUpdate += sqlSession.update(namespace2 + "mileageUpdate", member);

			if (resInsert > 0 && resUpdate >0) {
				sqlSession.commit();
			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			throw new RuntimeException(e.getCause());
		} finally {
			sqlSession.close();
		}
	}
	
	public void insertSaleUpdateCountTransaciton(Map<String, List<Sale>> map,Member member) {
		int resInsert = 0;
		int resUpdate = 0;
		SqlSession sqlSession = MybatisSqlSessionFactory.openSession();
		try {
			resInsert += sqlSession.insert(namespace + "insertSale", map);//판매테이블에 추가
			resUpdate += sqlSession.update(namespace2 + "CountUpdateKCM", member);// 사용횟수 1증가

			if (resInsert > 0 && resUpdate >0) {
				sqlSession.commit();
			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			throw new RuntimeException(e.getCause());
		} finally {
			sqlSession.close();
		}
	}
	
	
	public void insertSaleUpdateCountUpdateCouponTransaciton(Map<String, List<Sale>> map,Member member,Map<String, Object> map2) {
		int resInsert = 0;
		int resUpdate = 0;
		int resUpdate2 = 0;
		SqlSession sqlSession = MybatisSqlSessionFactory.openSession();
		try {
			resInsert += sqlSession.insert(namespace + "insertSale", map); //판매테이블에 추가
			resUpdate += sqlSession.update(namespace2 + "CountUpdateKCM", member); // 사용횟수 1증가
			resUpdate2 += sqlSession.update(namespace2 + "couponDelete",map2); //쿠폰 사용 체크함
			if (resInsert > 0 && resUpdate >0 && resUpdate2>0) {
				sqlSession.commit();
			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			throw new RuntimeException(e.getCause());
		} finally {
			sqlSession.close();
		}
	}
	
}
