package kr.or.yi.foodMgn.handler.manager;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.daoImpl.EventDaoImpl;
import kr.or.yi.foodMgn.dto.Event;
import kr.or.yi.foodMgn.dto.EventPage;

public class EventHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		EventDao dao = new EventDaoImpl();
		String sPage = req.getParameter("page");
		int page = 1;
		if(sPage != null) {
			page = Integer.parseInt(sPage);
		}
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*10);
			map.put("size", 10);
			
			List<Event> nlist = dao.selectListPage(map);
			for(Event e : nlist) {
				Date date = new Date();
				if((date.getTime()-e.geteEndDate().getTime()>0)) {
					e.seteIng(false);
				}
				
			}
			int totalCount = dao.selectTotalCount();
			
			EventPage np = new EventPage(totalCount, page, 10, nlist);
			req.setAttribute("eventPage", np);
			
			return "/WEB-INF/view/manager/event.jsp";
		}else {
			String current = req.getParameter("current");
			res.setContentType("application/json;charset=utf-8");
			if(current.equals("ing")) {
				Map<String , Integer> map = new HashMap<>();
				map.put("startRow", (page-1)*10);
				map.put("size", 10);
				
				List<Event> nlist = dao.selectIngListPage(map);
				int totalCount = dao.selectTotalCount();
				EventPage np = new EventPage(totalCount, page, 10, nlist);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(np); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			
			}else if(current.equals("end")) {
				Map<String , Integer> map = new HashMap<>();
				map.put("startRow", (page-1)*10);
				map.put("size", 10);
				
				List<Event> nlist = dao.selectEndListPage(map);
				int totalCount = dao.selectTotalCount();
				EventPage np = new EventPage(totalCount, page, 10, nlist);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(np); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			
			
			}
			
		}
		return null;
	}

}
