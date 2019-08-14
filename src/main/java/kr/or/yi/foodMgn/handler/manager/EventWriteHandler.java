package kr.or.yi.foodMgn.handler.manager;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.daoImpl.EventDaoImpl;
import kr.or.yi.foodMgn.dto.Event;

public class EventWriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/manager/smart.jsp";
		}else {
			String title = req.getParameter("title"); // 게시물 제목
			String content = req.getParameter("content"); // 게시물 내용
			String eName = "관리자"; //관리자
			String date = req.getParameter("date");
			String date2 = req.getParameter("date2");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			sd.parse(date);//시작날짜
			sd.parse(date2);//마감날짜
			boolean eIng = true;
			
			Event event = new Event(eName, title, content, sd.parse(date), sd.parse(date2), eIng);
			
			EventDao eDao = new EventDaoImpl();
			eDao.insertEvent(event);
			
			
			res.sendRedirect(req.getContextPath()+"/event.do");
			return null;
			
		}
		
	}

}
