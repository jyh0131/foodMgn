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

public class SaleListChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/manager/list/saleListChart.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			SaleListService service = SaleListService.getInstance();
			List<Payment> list = service.selectPaymentByAll();
			Map<String, List<Payment>> map = new HashMap<>();
			map.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map); 
			res.setContentType("apllication/json;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			return  null;
		}
		return null;
	}

}
