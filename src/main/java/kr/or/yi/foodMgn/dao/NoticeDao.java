package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.Notice;

public interface NoticeDao {
	public List<Notice> selectNoticeByAll();
	public List<Notice> selectNoticeByAll2();
	public int insertNotice(Notice notice);
	public Notice selectNoticeByNo(Notice notice);
	public List<Notice> selectListPage(Map<String, Integer> map);
	public int selectTotalCount();
	public int readNtAdd(Map<String, Integer> map);
}
