package kr.or.yi.foodMgn.handler.notice;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;

public class NoticeMgnDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int nNo = Integer.parseInt(req.getParameter("nNo"));
		
		NoticeDao dao = new NoticeDaoImpl();
		Notice notice = new Notice(nNo);
		notice.setNoDelete(true);
		int result = dao.deleteNotice(notice);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		if(result != 0) {
			map.put("success", true);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
		}
		return null;
	}

}
