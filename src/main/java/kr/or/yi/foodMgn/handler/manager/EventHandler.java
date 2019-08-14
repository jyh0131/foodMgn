package kr.or.yi.foodMgn.handler.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.daoImpl.EventDaoImpl;
import kr.or.yi.foodMgn.dto.Event;
import kr.or.yi.foodMgn.dto.EventPage;

public class EventHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String sPage = req.getParameter("page");
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			EventDao dao = new EventDaoImpl();
			

			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*10);
			map.put("size", 10);
			
			List<Event> nlist = dao.selectListPage(map);
			int totalCount = dao.selectTotalCount();
			
			EventPage np = new EventPage(totalCount, page, 10, nlist);
			req.setAttribute("eventPage", np);
			
			return "/WEB-INF/view/manager/event.jsp";
		}
		return null;
	}

}
