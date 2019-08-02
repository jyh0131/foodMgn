package kr.or.yi.foodMgn.dao;

import java.util.List;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.yi.foodMgn.AbstractTest;
import kr.or.yi.foodMgn.daoImpl.SalesStatusDaoImpl;
import kr.or.yi.foodMgn.dto.SalesStatus;

public class SalesStatusDaoTest extends AbstractTest{
	private static SalesStatusDao dao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao = new SalesStatusDaoImpl();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		dao = null;
	}

	
	
	//@Test
	public void test04selectSalesStatusByDate() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		List<SalesStatus> lists = dao.selectSalesStatusByDate("2019-07-24");
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
	
	@Test
	public void test03selectSalesStatusByAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		List<SalesStatus> lists = dao.selectSalesStatusByAll();
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
	
	


}
