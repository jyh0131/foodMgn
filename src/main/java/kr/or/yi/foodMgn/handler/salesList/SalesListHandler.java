package kr.or.yi.foodMgn.handler.salesList;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dto.SalesStatus;
import kr.or.yi.foodMgn.service.SalesListService;

public class SalesListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String date = req.getParameter("date");
		String date2 = req.getParameter("date2");
		SalesListService service = SalesListService.getInstance();
		if(date!=null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("date", date);
			map.put("date2", date2);
			
			List<SalesStatus> list = service.selectSalesStatusByDateRange(map);
			Map<String, List<SalesStatus>> map2 = new HashMap<>();
			map2.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map2); 
			res.setContentType("application/json;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
		}else {
			
			List<SalesStatus> list = service.selectSalesStatusByAll();
			int count = list.size();
			req.setAttribute("count", count);
			req.setAttribute("list", list);
			return "/WEB-INF/manager/list/salesList.jsp";
		}
		
	}

}
