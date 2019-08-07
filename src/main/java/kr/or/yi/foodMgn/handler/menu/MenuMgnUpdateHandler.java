package kr.or.yi.foodMgn.handler.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.dto.Food;

public class MenuMgnUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int fNo = Integer.parseInt(req.getParameter("fNo"));
		
//		FoodDao dao = new FoodDaoImapl();
//		Food food = new Food(fNo);
//		food.setFdPrice(fdPrice);
		return null;
	}

}
