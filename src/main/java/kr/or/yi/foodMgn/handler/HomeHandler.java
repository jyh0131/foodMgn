package kr.or.yi.foodMgn.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.dao.SalesStatusDao;
import kr.or.yi.foodMgn.daoImpl.EventDaoImpl;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.daoImpl.SalesStatusDaoImpl;
import kr.or.yi.foodMgn.dto.Event;
import kr.or.yi.foodMgn.dto.Notice;
import kr.or.yi.foodMgn.dto.SalesStatus;

public class HomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		EventDao eDao = new EventDaoImpl();
		NoticeDao nDao = new NoticeDaoImpl();
		SalesStatusDao sDao = new SalesStatusDaoImpl();
		List<Event> eventList = eDao.selectFourListPage();
		List<Notice> noticeList = nDao.selectFour();
		List<SalesStatus> saleList = sDao.selectSalesStatusByFive();
		req.setAttribute("eventList",eventList);
		req.setAttribute("notice", noticeList);
		req.setAttribute("saleList", saleList);
		return "/WEB-INF/view/home/home.jsp";
	}

}
