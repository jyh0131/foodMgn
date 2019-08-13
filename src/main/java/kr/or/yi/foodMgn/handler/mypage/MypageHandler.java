package kr.or.yi.foodMgn.handler.mypage;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Member;

public class MypageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int no = (int) req.getSession().getAttribute("Auth");
			
			MemberDao dao = new MemberDaoImpl();
			Member m = new Member(no);
			Member member = dao.selectByMbNo(m);
			
			req.setAttribute("member", member);
			
			return "/WEB-INF/view/mypage/mypage.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String birth = req.getParameter("birth");
			String addr1 = req.getParameter("addr");
			String addr2 = req.getParameter("addr2");
			String addr3 = req.getParameter("addr3");
			String addr4 = req.getParameter("addr4");
			String addr = addr1 + " " + addr3 + addr4 + " (" + addr2 + " " + addr3 + ")";
			
			int no = (int) req.getSession().getAttribute("Auth");
			
			MemberDao dao = new MemberDaoImpl();
			Member m = new Member(no);
			Member member = dao.selectByMbNo(m);
			member.setMbName(name);
			member.setMbTel(tel);
			member.setMbAddress(addr);
			
			int result = dao.myPageUpdate(member);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(result != 0) {
				map.put("success", true);
				map.put("name", name);
				map.put("tel", tel);
				map.put("addr", addr);
				map.put("birth", birth);
				
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				
				return null;
			}
		}
		return null;
	}

}
