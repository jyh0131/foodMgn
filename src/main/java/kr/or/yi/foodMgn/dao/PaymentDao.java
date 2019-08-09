package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.Payment;

public interface PaymentDao {
	public List<Payment> selectPaymentByAll();
	public List<Payment> selectPaymentByDate(String date);
	public List<Payment> selectPaymentByAll2(int no);
	public List<Payment> selectPaymentByDate2(Map<String, Object> map);
}
