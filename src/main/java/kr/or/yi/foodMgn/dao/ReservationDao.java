package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Reservation;

public interface ReservationDao {
	public int insertRsv(Reservation rsv);
	public List<Reservation> selectByTime();
	public int deleteRsv(Reservation rsv);
	public List<Reservation> selectByTel(Member member);
	public List<Reservation> selectByDate(String date);
	public Reservation selectByTimeTable(Reservation rsv);
	public int updateRsv(Map<String, Object> map);
	
	public List<Reservation> selectByRangeTime(Reservation rsv);
}
