package kr.or.yi.foodMgn.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.yi.foodMgn.controller.CommandHandler;

public class LogOutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			session.removeAttribute("Auth");
		}
		
		res.sendRedirect(req.getContextPath() + "/");
		return null;
	}

}
