package kr.or.yi.foodMgn.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoManagerDao;
import kr.or.yi.foodMgn.daoImpl.NoManagerDaoImpl;
import kr.or.yi.foodMgn.dto.NoManager;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/login.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			System.out.println(id + "," + pw);
			
			NoManagerDao nmDao = new NoManagerDaoImpl();
			NoManager nm = new NoManager(id);
			NoManager noManager = nmDao.selectById(nm);
			
			if(noManager == null) { //비회원
				req.setAttribute("noMember", true);
				return "/WEB-INF/view/login/login.jsp";
			}else if(noManager.getNmgPwd().equals(pw) == false) { //비밀번호 틀렸을 때
				req.setAttribute("noPassWord", true);
				return "/WEB-INF/view/login/login.jsp";
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("Auth", true);
			
			res.sendRedirect(req.getContextPath() + "/");
			return null;
		}
		return null;
	}

}
