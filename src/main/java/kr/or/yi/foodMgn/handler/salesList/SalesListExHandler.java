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

public class SalesListExHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SalesListService service = SalesListService.getInstance();
		List<SalesStatus> list = service.selectSalesStatusByAll();
		for(int i=0; i< list.size(); i++) {
			list.get(i).setSsNo(i+1);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("data", list);
		ObjectMapper om = new ObjectMapper();
		String data = om.writeValueAsString(map);
		res.setContentType("apllication/json;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(data);
		out.flush();
		return null;
	}

}
