package kr.or.yi.foodMgn.handler.delivery;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.dao.FoodKindDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.daoImpl.FoodKindDaoImpl;
import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.dto.FoodKind;

public class FoodKindHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			FoodKindDao fDao = new FoodKindDaoImpl();
			List<FoodKind> fkList = fDao.selectFoodKindByAll();
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(fkList);
			res.setContentType("application/json;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
		}else {
			int foodkind = Integer.parseInt(req.getParameter("foodkind"));
			FoodDao dao = new FoodDaoImpl();
			FoodKind fkNo = new FoodKind(foodkind);
			Food food = new Food(fkNo);
			List<Food> foodList = dao.selectByNo(food);
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(foodList);
			res.setContentType("application/json;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
		}
		return null;
	}

}
