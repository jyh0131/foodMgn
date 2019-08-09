package kr.or.yi.foodMgn.handler.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.ManagerDao;
import kr.or.yi.foodMgn.daoImpl.ManagerDaoImpl;
import kr.or.yi.foodMgn.dto.Manager;

public class ManagerHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/manager/managerLogin.jsp";
		}else {
			String id = req.getParameter("id");
			String pass = req.getParameter("password");
			
			ManagerDao dao = new ManagerDaoImpl();
			Manager manager = new Manager();
			manager.setMgId(id);
			manager.setMgPwd(pass);
			
			Manager manager1 = dao.selectByPass(manager);
			
			if(manager1==null) {
				req.getSession().setAttribute("Mgn", "0");
			}else {
				req.getSession().setAttribute("Mgn", "1");
				
			}
			return "mgn/saleList.do";
		}
		
	}

}
