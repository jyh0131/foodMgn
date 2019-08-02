package kr.or.yi.foodMgn.dao;

import org.junit.AfterClass;
import org.junit.BeforeClass;

import kr.or.yi.foodMgn.AbstractTest;
import kr.or.yi.foodMgn.daoImpl.ManagerDaoImpl;

public class ManagerDaoTest extends AbstractTest {
	private static ManagerDao dao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao = new ManagerDaoImpl();
	
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		dao = null;
		
	}

	
	
	
}
