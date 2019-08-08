package kr.or.yi.foodMgn.handler.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;

public class NoticeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sPage = req.getParameter("page");
		int page = 1;
		if(sPage != null) {
			page = Integer.parseInt(sPage);
		}
		
		NoticeDao dao = new NoticeDaoImpl();
		
		List<Notice> nlist = dao.selectNoticeByAll();
		req.setAttribute("nList", nlist);
		
		return "/WEB-INF/view/community/notice.jsp";
	}

}
