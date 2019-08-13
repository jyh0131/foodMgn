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
import kr.or.yi.foodMgn.dto.FoodPage;

public class MenuMgnListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String sPage = req.getParameter("page");
			
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			FoodDao dao = new FoodDaoImpl();
			
//			List<Food> fList = fDao.selectFoodByAllF();
//			req.setAttribute("fList", fList);
			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*10);
			map.put("size", 10);
			
			List<Food> flist = dao.selectListPage(map);
			int totalCount = dao.selectTotalCount();
			
			FoodPage fp = new FoodPage(totalCount, page, 10, flist);
			req.setAttribute("foodPage", fp);
			
			return "/WEB-INF/manager/menu/menu_mgn.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String sPage = req.getParameter("page");
			
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			FoodDao dao = new FoodDaoImpl();
			
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
		}
		return null;
	}

}
