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
import kr.or.yi.foodMgn.dao.FoodKindDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.daoImpl.FoodKindDaoImpl;
import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.dto.FoodKind;

public class MenuHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int fkno = Integer.parseInt(req.getParameter("fkno"));
			
			FoodKind fk = new FoodKind(fkno);
			Food food = new Food(fk);
			
			FoodKindDao fkDao = new FoodKindDaoImpl();
			FoodDao fDao = new FoodDaoImpl();
			
			List<FoodKind> fkList = fkDao.selectFoodKindByAll();
			List<Food> fList = fDao.selectByNo(food);
			
			String fkName = fkDao.selectByFkNo(fk).getFkName();
			String fkNameEng = fkDao.selectByFkNo(fk).getFkNameEng();
			
			req.setAttribute("fkList", fkList);
			req.setAttribute("fList", fList);
			req.setAttribute("fkName", fkName);
			req.setAttribute("fkNameEng", fkNameEng);
			
			return "/WEB-INF/view/menu/menu.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			int fNo = Integer.parseInt(req.getParameter("fNo"));
			
			FoodDao fDao = new FoodDaoImpl();
			
			FoodKind fk = new FoodKind(fNo);
			Food food = new Food(fk);
			
			List<Food> fList = fDao.selectByNo(food);
			
			if(fList != null) {
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(fList);
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				
				return null;
			}
		}
		return null;
	}

}
