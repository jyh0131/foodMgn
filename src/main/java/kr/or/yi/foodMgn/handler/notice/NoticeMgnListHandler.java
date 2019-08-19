package kr.or.yi.foodMgn.handler.notice;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;
import kr.or.yi.foodMgn.dto.NoticePage;

public class NoticeMgnListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String sPage = req.getParameter("page");
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			NoticeDao dao = new NoticeDaoImpl();
			
//			List<Notice> nlist = dao.selectNoticeByAll();
//			req.setAttribute("nList", nlist);
			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*15);
			map.put("size", 15);
			
			List<Notice> nlist = dao.selectListPage2(map);
			int totalCount = dao.selectTotalCount();
			
			NoticePage np = new NoticePage(totalCount, page, 15, nlist);
			req.setAttribute("noticePage", np);
			
			return "/WEB-INF/manager/community/noticeList.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String sPage = req.getParameter("page");
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			NoticeDao dao = new NoticeDaoImpl();
			
//			List<Notice> nlist = dao.selectNoticeByAll();
//			req.setAttribute("nList", nlist);
			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*15);
			map.put("size", 15);
			
			List<Notice> nlist = dao.selectListPage2(map);
			int totalCount = dao.selectTotalCount();
			
			NoticePage np = new NoticePage(totalCount, page, 15, nlist);

			res.setContentType("application/json;charset=utf-8");
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(np);
			
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
		}
		return null;
	}

}
