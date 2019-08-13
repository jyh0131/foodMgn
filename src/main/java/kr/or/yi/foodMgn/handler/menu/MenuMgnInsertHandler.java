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
import kr.or.yi.foodMgn.dto.FoodPage;

public class MenuMgnInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String sPage = req.getParameter("page");
			
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			String fk = req.getParameter("fkname");
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
			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*10);
			map.put("size", 10);
			
			List<Food> flist = dao.selectListPage(map);
			int totalCount = dao.selectTotalCount();
			
			FoodPage fp = new FoodPage(totalCount, page, 10, flist);
			
			res.setContentType("application/json;charset=utf-8");
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(fp);
			
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
			
			/*res.sendRedirect(req.getContextPath()+"/mgn/menuMgnlist.do");
			return null;*/
		}
		return null;
	}

}
