package kr.or.yi.foodMgn.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.yi.foodMgn.AbstractTest;
import kr.or.yi.foodMgn.daoImpl.ReservationDaoImpl;
import kr.or.yi.foodMgn.dto.Reservation;

public class ReservationDaoTest extends AbstractTest{
	private static ReservationDao rDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		rDao = new ReservationDaoImpl();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		rDao = null;
	}


//	@Test
//	public void test01InsertRsv() throws ParseException {
//		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
//		Member member = new Member(1);
//		member.setMbName("김우빈");
//		member.setMbTel("01012345678");
//		int rsvNumber =  10;
//		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//		Date date =  sd.parse("2019-08-13 13:10");
//		String tableNo = "no.1";
//		
//		Reservation rsv = new Reservation(rsvNumber, date, member, tableNo);
//		
//		int res = rDao.insertRsv(rsv);
//		log.debug(rsv.toString());
//		Assert.assertEquals(1, res);
//		
//	}
	
//	@Test
//	public void test01SelectByTime() throws ParseException {
//		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
//		List<Reservation> list = rDao.selectByTime();
//		log.debug(list.toString());
//		Assert.assertNotNull(list);
//		
//	}
	
//	@Test
//	public void test01DeleteRsv() throws ParseException {
//		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
//		Reservation rsv = new Reservation();
//		
//		String date = "2019-07-31 10:03";
//		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd kk:mm");
//		
//		
//		rsv.setRsvTime(sd.parse(date));
//		rsv.setRsvTableNo("no.1");
//		
//		int res = rDao.deleteRsv(rsv);
//		
//		
//		Assert.assertEquals(7, res);
//		
//	}
	
	@Test
	public void test01SelectByRangeTime() throws ParseException {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		Reservation rsv = new Reservation();
		String date = "2019-07-31 15:30";
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		Date rsvTime = sd.parse(date);
		rsv.setRsvTime(rsvTime);
		List<Reservation> list = rDao.selectByRangeTime(rsv);
		log.debug(list.toString());
		Assert.assertNotNull(list);
	}
}





















