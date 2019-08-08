package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.Notice;

public interface NoticeDao {
	public List<Notice> selectNoticeByAll();
	public int insertNotice(Notice notice);
	public Notice selectNoticeByNo(Notice notice);
}
