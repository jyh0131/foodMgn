package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.Event;

public interface EventDao {
	public List<Event> selectListPage(Map<String, Integer> map);
	public int selectTotalCount();
	public int insertEvent(Event event);
	public Event selectByNo(int no);
	public int deleteEvent(int no);
	public int updateEvent(Event event);
}
