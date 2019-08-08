package kr.or.yi.foodMgn.handler.menu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.dto.Food;

public class MenuMgnListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		FoodDao fDao = new FoodDaoImpl();
		
		List<Food> fList = fDao.selectFoodByAllF();
		
		req.setAttribute("fList", fList);
		
		return "/WEB-INF/manager/menu/menu_mgn.jsp";
	}

}
