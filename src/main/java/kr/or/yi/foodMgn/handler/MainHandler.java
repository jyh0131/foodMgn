package kr.or.yi.foodMgn.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;

public class MainHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/index.jsp";
		}
		return null;
	}

}
