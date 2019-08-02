package kr.or.yi.foodMgn.dao;

import java.util.Date;
import java.util.List;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import kr.or.yi.foodMgn.AbstractTest;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Coupon;
import kr.or.yi.foodMgn.dto.Grade;
import kr.or.yi.foodMgn.dto.Member;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MemberDaoTest extends AbstractTest {
	private static MemberDao memberDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		memberDao = new MemberDaoImpl();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		memberDao = null;
	}

	@Test
	public void test01SelectMemberByAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		List<Member> lists = memberDao.selectMemberByAll();
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
	
	//@Test
	public void test02InsertMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member member = new Member(0, "변지영", new Date(), "01020544177", 1000, new Grade("bronze"), "대구", null, false);
		int res = memberDao.insertMember(member);
		System.out.println(res);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test03SelectMemberByTel() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member member = new Member();
		member.setMbTel("1234");
		
		List<Member> lists = memberDao.selectMemberByTel(member);
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
	
	//@Test
	public void test06SelectMemberByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member searchMember = new Member(1);
		List<Member> lists = memberDao.selectMemberByNo(searchMember);
		log.debug(lists.toString());
		Assert.assertNotNull(lists);
	}
	
	//@Test
	public void test04UpdateMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member member = new Member(1);
		member.setMbMileage(10000);
		member.setMbGrade(new Grade("vip"));
		member.setMbAddress("서울");
		
		int res = memberDao.updateMember(member);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test05DeleteMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member member = new Member(1);
		member.setMbWithdrawal(true);
		int res = memberDao.deleteMember(member);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test06SelectByTel() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member member = memberDao.selectByTel(12345678);
		log.debug(member.toString());
		
		for(Coupon c : member.getCoupon()) {
			log.debug(c.toString());
		}
		Assert.assertNotNull(member);
	}
	
	//@Test
	public void test07MileageUpdate() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member member = new Member(2);
		member.setMbMileage(10000);
		
		int res = memberDao.mileageUpdate(member);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test08SelectCouponByTel() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		
		Member member = memberDao.selectByTel(87654321);
		log.debug(member.toString());
		
		for(Coupon c : member.getCoupon()) {
			log.debug(c.toString());
		}
		Assert.assertNotNull(member);
	}
}
