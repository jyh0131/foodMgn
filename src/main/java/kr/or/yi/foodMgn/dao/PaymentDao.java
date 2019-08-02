package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.Payment;

public interface PaymentDao {
	public List<Payment> selectPaymentByAll();
	public List<Payment> selectPaymentByDate(String date);
}
