package kr.or.yi.foodMgn.dao;

import java.util.List;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import kr.or.yi.foodMgn.AbstractTest;
import kr.or.yi.foodMgn.daoImpl.CouponDaoImpl;
import kr.or.yi.foodMgn.dto.Coupon;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CouponDaoTest extends AbstractTest {
	private static CouponDao couponDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		couponDao = new CouponDaoImpl();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		couponDao = null;
	}

	@Test
	public void test01SelectByCouponAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		List<Coupon> lists = couponDao.selectByCouponAll();
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
}
