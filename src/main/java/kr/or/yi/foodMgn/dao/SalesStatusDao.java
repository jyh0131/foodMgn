package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.SalesStatus;

public interface SalesStatusDao {
	public List<SalesStatus> selectSalesStatusByAll();
	public List<SalesStatus> selectSalesStatusByDate(String date);

	public List<SalesStatus> selectSalesStatusByDateRange(Map<String, Object> map);

	public List<SalesStatus> selectSalesStatusByFive();

}
