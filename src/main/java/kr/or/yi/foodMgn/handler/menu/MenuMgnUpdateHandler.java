package kr.or.yi.foodMgn.handler.menu;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.dto.Food;

public class MenuMgnUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int fNo = Integer.parseInt(req.getParameter("fNo"));
		String str_price = req.getParameter("uprice");
		
		Food food = new Food(fNo);
		FoodDao dao = new FoodDaoImpl();
		int price = food.getFdPrice();;
		
		if(str_price != "") {
			price = Integer.parseInt(str_price);
		}
		
		food.setFdPrice(price);
		
		int result = dao.updateFood(food);
		//req.setAttribute("price", price);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(result != 0) {
			map.put("success", true);
			map.put("price", price);
			
			res.setContentType("application/json;charset=utf-8");
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
		}
		return null;
	}

}
