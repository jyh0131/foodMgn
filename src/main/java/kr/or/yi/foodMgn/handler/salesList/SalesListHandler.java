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
		SalesListService service = SalesListService.getInstance();
		if(date!=null) {
			List<SalesStatus> list = service.selectSalesStatusByDate(date);
			Map<String, List<SalesStatus>> map = new HashMap<>();
			map.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map); 
			res.setContentType("apllication/json;charset=utf-8");
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
