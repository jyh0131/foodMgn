package kr.or.yi.foodMgn.handler.manager;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.daoImpl.EventDaoImpl;
import kr.or.yi.foodMgn.dto.Event;

public class EventUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int no = Integer.parseInt(req.getParameter("no"));
			EventDao dao = new EventDaoImpl();
			Event event = dao.selectByNo(no);
			req.setAttribute("event", event);
			
			return "/WEB-INF/view/manager/update.jsp";
		}else {
			int no = Integer.parseInt(req.getParameter("no"));
			String title = req.getParameter("title"); // 게시물 제목
			String content = req.getParameter("content"); // 게시물 내용
			String eName = "관리자"; //관리자
			String date = req.getParameter("date");
			String date2 = req.getParameter("date2");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			sd.parse(date);//시작날짜
			sd.parse(date2);//마감날짜
			boolean eIng = true;
			
			Event event = new Event(no, eName, title, content, sd.parse(date), sd.parse(date2), eIng);
			
			EventDao eDao = new EventDaoImpl();
			eDao.updateEvent(event);
			req.setAttribute("eventUpdate", "success");
			
			return "/WEB-INF/view/manager/result.jsp";
		}
	}

}
