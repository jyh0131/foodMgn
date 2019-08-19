package kr.or.yi.foodMgn.handler.saleList;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dto.Payment;
import kr.or.yi.foodMgn.service.SaleListService;

public class SaleListMemberChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SaleListService service = SaleListService.getInstance();
		
		if(req.getMethod().equalsIgnoreCase("get")) {
			List<Payment> list = service.selectPaymentByAllMmember();
			Map<String, List<Payment>> map = new HashMap<>();
			map.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map); 
			res.setContentType("apllication/json;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			return  null;
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String date = req.getParameter("date");
			String date2 = req.getParameter("date2");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("date", date);
			map.put("date2", date2);
			List<Payment> list = service.selectPaytmentByDateRangeMember(map);
			
			res.setContentType("application/json;charset=utf-8");
			System.out.println(list);
			
			Map<String, List<Payment>> map2 = new HashMap<>();
			map2.put("list", list);
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map2); 
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
		}
		return null;
		
	}

}
