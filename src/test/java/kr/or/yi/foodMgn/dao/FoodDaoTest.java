package kr.or.yi.foodMgn.dao;

import java.util.List;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import kr.or.yi.foodMgn.AbstractTest;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.dto.FoodKind;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class FoodDaoTest extends AbstractTest {
	private static FoodDao foodDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		foodDao = new FoodDaoImpl();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		foodDao = null;
	}

	@Test
	public void test01SelectFoodByAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		List<Food> lists = foodDao.selectFoodByAll();
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
	
	//@Test
	public void test02InsertFood() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		Food food = new Food(75, 1000, "공기밥", new FoodKind(1));
		int res = foodDao.insertFood(food);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test03SelectByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		Food selfood = new Food(new FoodKind(1));
		List<Food> lists = foodDao.selectByNo(selfood);
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
	
	//@Test
	public void test04UpdateFood() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		Food food = new Food(75, 2000, "공기밥", new FoodKind(2));
		int res = foodDao.updateFood(food);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test05DeleteFood() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		Food food = new Food(75);
		int res = foodDao.deletFood(food);
		Assert.assertEquals(1, res);
	}
}
