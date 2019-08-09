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
		SaleListService service = SaleListService.getInstance();
		if(date!=null) {
			List<Payment> list = service.selectPaymentByDate(date);
			Map<String, List<Payment>> map = new HashMap<>();
			map.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map); 
			res.setContentType("apllication/json;charset=utf-8");
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
			res.setContentType("apllication/json;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			return null;
		}
	}

}
