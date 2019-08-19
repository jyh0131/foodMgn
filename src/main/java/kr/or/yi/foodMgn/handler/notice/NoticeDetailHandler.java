package kr.or.yi.foodMgn.handler.notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;

public class NoticeDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int no = Integer.parseInt(req.getParameter("no"));
			int page = Integer.parseInt(req.getParameter("page"));
			
			NoticeDao dao = new NoticeDaoImpl();
			Notice n = new Notice(no);
			
			Notice notice = dao.selectNoticeByNo(n);
			
			int read_nt = notice.getNoReadNt();
			notice.setNoReadNt(++read_nt);
			dao.updateReadNt(notice);
			
			req.setAttribute("notice", notice);
			
			req.setAttribute("page", req.getParameter("page"));
			
			return "/WEB-INF/view/community/notice_detail.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			int no = Integer.parseInt(req.getParameter("nNo"));
			
			NoticeDao dao = new NoticeDaoImpl();
			Notice n = new Notice(no);
			
			Notice notice = dao.selectNoticeByNo(n);
			
			int read_nt = notice.getNoReadNt();
			notice.setNoReadNt(++read_nt);
			dao.updateReadNt(notice);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(notice);
			
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
		}
		return null;
	}
}
