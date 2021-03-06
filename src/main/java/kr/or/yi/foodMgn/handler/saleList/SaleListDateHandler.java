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
import kr.or.yi.foodMgn.dto.SalesStatus;
import kr.or.yi.foodMgn.service.SaleListService;

public class SaleListDateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String date = req.getParameter("date");
		String date2 = req.getParameter("date2");
		SaleListService service = SaleListService.getInstance();
		if(date!=null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("date", date);
			map.put("date2", date2);
			List<Payment> list = service.selectPaytmentByDateRange(map);
			
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
		}else {
			List<Payment> list = service.selectPaymentByAll();
			Map<String, List<Payment>> map = new HashMap<>();
			map.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map); 
			res.setContentType("application/json;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			return null;
		}
	}

}
