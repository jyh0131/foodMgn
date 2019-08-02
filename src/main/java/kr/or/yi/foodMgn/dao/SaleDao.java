package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.Sale;

public interface SaleDao {
	public List<Sale> selectSaleByAll();
	public List<Sale> selectSaleByDate(String date);
	public int insertSale(Map<String, List<Sale>> map);
	
	public int updateSaleByCancel(Map<String,Integer> map);
	public Sale selectLastNo();
	
	public int totalPrice(int number);
}
