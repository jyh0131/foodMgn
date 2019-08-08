package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.Notice;

public interface NoticeDao {
	public List<Notice> selectNoticeByAll();
	public List<Notice> selectNoticeByAll2();
	public int insertNotice(Notice notice);
	public Notice selectNoticeByNo(Notice notice);
	public List<Notice> selectListPage(int startrow, int size);
}
