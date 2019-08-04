package kr.or.yi.foodMgn.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "/WEB-INF/view/login/login.jsp";
	}

}
