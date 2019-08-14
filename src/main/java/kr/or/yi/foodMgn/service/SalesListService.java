package kr.or.yi.foodMgn.service;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dao.SalesStatusDao;
import kr.or.yi.foodMgn.daoImpl.SalesStatusDaoImpl;
import kr.or.yi.foodMgn.dto.SalesStatus;

public class SalesListService {
	private static SalesListService service = new SalesListService();
	private SalesStatusDao dao;
	
	public static SalesListService getInstance() {
		return service;
	}

	public SalesListService() {
		dao = new SalesStatusDaoImpl();
	}
	
	public List<SalesStatus> selectSalesStatusByAll(){
		return dao.selectSalesStatusByAll();
	}
	
	public List<SalesStatus> selectSalesStatusByDate(String searchDate){
		return dao.selectSalesStatusByDate(searchDate);
	}
	
	public List<SalesStatus> selectSalesStatusByDateRange(Map<String,Object> map){
		return dao.selectSalesStatusByDateRange(map);
	}
}
