package kr.or.yi.foodMgn.handler.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;

public class NoticeMgnUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/manager/community/noticeUpdate.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
