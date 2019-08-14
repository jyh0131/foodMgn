package kr.or.yi.foodMgn.handler.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.MemberPage;

public class MemberMgnListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String sPage = req.getParameter("page");
			
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			MemberDao dao = new MemberDaoImpl();
			
//			List<Member> mlist = mDao.selectMemberByAllNM();
//			req.setAttribute("mList", mlist);
			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*20);
			map.put("size", 20);
			
			List<Member> mlist = dao.selectListPage(map);
			int totalCount = dao.selectTotalCount();
			
			MemberPage mp = new MemberPage(totalCount, page, 20, mlist);
			req.setAttribute("memberPage", mp);
			
			return "/WEB-INF/manager/member/member_mgn.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String sPage = req.getParameter("page");
			
			int page = 1;
			if(sPage != null) {
				page = Integer.parseInt(sPage);
			}
			
			MemberDao dao = new MemberDaoImpl();
			
			Map<String , Integer> map = new HashMap<>();
			map.put("startRow", (page-1)*20);
			map.put("size", 20);
			
			List<Member> mlist = dao.selectListPage(map);
			int totalCount = dao.selectTotalCount();
		
			System.out.println(mlist);
			
			MemberPage mp = new MemberPage(totalCount, page, 20, mlist);
			
			res.setContentType("application/json;charset=utf-8");
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(mp);
			
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
			
			return null;
		}
		return null;
	}

}
