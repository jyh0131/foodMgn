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

public class MenuMgnListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		FoodDao fDao = new FoodDaoImpl();
		List<Food> fList = fDao.selectFoodByAllF();

		String allList = req.getParameter("allList");
		
		if(allList == null) {
			req.setAttribute("fList", fList);
			
			return "/WEB-INF/manager/menu/menu_mgn.jsp";
		}else if(allList.equals("yes")) {
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("success", true);
			
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
