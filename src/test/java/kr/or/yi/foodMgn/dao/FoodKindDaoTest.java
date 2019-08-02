package kr.or.yi.foodMgn.dao;

import java.util.List;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.yi.foodMgn.AbstractTest;
import kr.or.yi.foodMgn.daoImpl.FoodKindDaoImpl;
import kr.or.yi.foodMgn.dto.FoodKind;
import kr.or.yi.foodMgn.dto.FoodMenu;



public class FoodKindDaoTest extends AbstractTest {
	private static FoodKindDao dao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao = new FoodKindDaoImpl();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		dao = null;
	}
	@Test
	public void test01SelectByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		FoodMenu menu = new FoodMenu();
		menu.setMenuNo(1);
		FoodKind food = new FoodKind();
		food.setMenuNo(menu);
		List<FoodKind> list = dao.selectByNo(food);
		System.out.println(list.toString());
		Assert.assertNotNull(list);
	}
}

