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

public class NoticeSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/community/notice.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String opt = req.getParameter("opt");
			String search = req.getParameter("search");
			String search2 = req.getParameter("search2");
			
			String sPage = req.getParameter("page");
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			//System.out.println(page);
			
			NoticeDao dao = new NoticeDaoImpl();
			
			Map<String , Object> map = new HashMap<>();
			
			if(search2 == null && search != null) {
				if(opt.equals("제목")) {
					Notice notice = new Notice();
					notice.setNoTitle(search);
					List<Notice> list = dao.selectNoticeByTitle(notice);
					
					map.put("list", list);
					map.put("startRow", (page-1)*10);
					map.put("size", 10);
					
					int totalCount = dao.selectTotalCount();
					
					NoticePage np = new NoticePage(totalCount, page, 10, list);
//					req.setAttribute("noticePage", np);
					
					res.setContentType("application/json;charset=utf-8");
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(np);
					
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					
					return null;
				}else if(opt.equals("내용")) {
					Notice notice = new Notice();
					notice.setNoContent(search);
					List<Notice> list = dao.selectNoticeByContent(notice);
					
					map.put("list", list);
					map.put("startRow", (page-1)*10);
					map.put("size", 10);
					
					int totalCount = dao.selectTotalCount();
					
					NoticePage np = new NoticePage(totalCount, page, 10, list);
					
					res.setContentType("application/json;charset=utf-8");
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(np);
					
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					
					return null;
				}else {
					Notice notice = new Notice();
					notice.setNoContent(search);
					notice.setNoTitle(search);
					List<Notice> list = dao.selectNoticeByTitleandContent(notice);
					
					map.put("list", list);
					map.put("startRow", (page-1)*10);
					map.put("size", 10);
					
					int totalCount = dao.selectTotalCount();
					
					NoticePage np = new NoticePage(totalCount, page, 10, list);
					
					res.setContentType("application/json;charset=utf-8");
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(np);
					
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					
					return null;
				}
			}else if(search2 != null && search == null) {
				Notice notice = new Notice();
				notice.setNoContent(search2);
				notice.setNoTitle(search2);
				List<Notice> list = dao.selectNoticeByTitleandContent(notice);
				
				map.put("list", list);
				map.put("startRow", (page-1)*10);
				map.put("size", 10);
				
				int totalCount = dao.selectTotalCount();
				
				NoticePage np = new NoticePage(totalCount, page, 10, list);
				
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(np);
				
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				
				return null;
			}
			
		}
		return null;
	}

}
