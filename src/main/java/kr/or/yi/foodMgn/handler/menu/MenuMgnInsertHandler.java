package kr.or.yi.foodMgn.handler.menu;

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

public class MenuMgnInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String fk = req.getParameter("fk");
			String fdname = req.getParameter("name");
			int price = Integer.parseInt(req.getParameter("price"));
			
			FoodDao dao = new FoodDaoImpl();
			FoodKindDao fkDao = new FoodKindDaoImpl();
			
			List<Food> list = dao.selectFoodByAllF();
			int no = list.size()+1;
			
			FoodKind fkind = new FoodKind(fk);
			FoodKind fkind2 = fkDao.selectByName(fkind);

			Food food = new Food(no, price, fdname, fkind2);
			dao.insertFood(food);
			
			res.sendRedirect(req.getContextPath()+"/mgn/menuMgnlist.do");
			return null;
		}
		return null;
	}

}
