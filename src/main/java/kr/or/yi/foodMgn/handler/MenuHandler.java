package kr.or.yi.foodMgn.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.dao.FoodKindDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.daoImpl.FoodKindDaoImpl;
import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.dto.FoodKind;

public class MenuHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		FoodKindDao fkDao = new FoodKindDaoImpl();
		FoodDao fDao = new FoodDaoImpl();
		
		
		List<FoodKind> fkList = fkDao.selectFoodKindByAll();
		req.setAttribute("fkList", fkList);
		
		return "/WEB-INF/view/menu/menu.jsp";
	}

}
