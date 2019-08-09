package kr.or.yi.foodMgn.handler.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;
import kr.or.yi.foodMgn.dto.NoticePage;

public class NoticeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sPage = req.getParameter("page");
		int page = 1;
		if(sPage != null) {
			page = Integer.parseInt(sPage);
		}
		
		NoticeDao dao = new NoticeDaoImpl();
		
//		List<Notice> nlist = dao.selectNoticeByAll();
//		req.setAttribute("nList", nlist);
		
		Map<String , Integer> map = new HashMap<>();
		map.put("startRow", (page-1)*10);
		map.put("size", 20);
		
		List<Notice> nlist = dao.selectListPage(map);
		int totalCount = dao.selectTotalCount();
		
		NoticePage np = new NoticePage(totalCount, page, 20, nlist);
		req.setAttribute("noticePage", np);
		
		return "/WEB-INF/view/community/notice.jsp";
	}

}
