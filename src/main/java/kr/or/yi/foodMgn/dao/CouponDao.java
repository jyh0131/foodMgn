package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.Coupon;

public interface CouponDao {
	public List<Coupon> selectByCouponAll();
}
