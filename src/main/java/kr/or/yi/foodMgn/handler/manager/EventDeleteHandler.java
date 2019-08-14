package kr.or.yi.foodMgn.handler.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.daoImpl.EventDaoImpl;

public class EventDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int no = Integer.parseInt(req.getParameter("no"));
			EventDao dao = new EventDaoImpl();
			dao.deleteEvent(no);
			req.setAttribute("eventDelete", "success");
			return "/WEB-INF/view/manager/result.jsp";
		}
		return null;
	}

}
