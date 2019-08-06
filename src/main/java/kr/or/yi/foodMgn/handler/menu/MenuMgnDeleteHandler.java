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

public class MenuMgnDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int fNo = Integer.parseInt(req.getParameter("fNo"));
		
		FoodDao dao = new FoodDaoImpl();
		Food food = new Food(fNo);
		food.setFdWithdrawal(true);
		dao.deletFood(food);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("success", true);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map);
		
		PrintWriter out = res.getWriter();
		out.print(json);
		out.flush();
		
		return null;
	}

}
