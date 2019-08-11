package kr.or.yi.foodMgn.handler.menu;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.dto.FoodKind;

public class MenuMgnSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String fdname = req.getParameter("fdname");
			
			FoodDao dao = new FoodDaoImpl();
			
			Food food = new Food();
			food.setFdName(fdname);
			List<Food> list = dao.selectByName(food);
			
			
//			Map<String, Boolean> map = new HashMap<String, Boolean>();

			if(list != null) {
//				map.put("islist", list);
				
				res.setContentType("application/json;charset=utf-8");
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list);
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				
				return null;
			}
		}
		return null;
	}

}
