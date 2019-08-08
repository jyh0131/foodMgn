package kr.or.yi.foodMgn.handler.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;

public class NoticeDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int no = Integer.parseInt(req.getParameter("no"));
		int page = Integer.parseInt(req.getParameter("page"));
		
		NoticeDao dao = new NoticeDaoImpl();
		Notice n = new Notice(no);
		
		Notice notice = dao.selectNoticeByNo(n);
		
		req.setAttribute("notice", notice);
		
		Map<String, Integer> map = new HashMap<>();
		int count = notice.getNoReadNt();
		map.put("noReadNt", ++count);
		map.put("noNo", no);
		
		dao.readNtAdd(map);
		
		System.out.println(n);
		
		//req.setAttribute("page", req.getParameter("page"));
		
		return "/WEB-INF/view/community/notice_detail.jsp";
	}

}
