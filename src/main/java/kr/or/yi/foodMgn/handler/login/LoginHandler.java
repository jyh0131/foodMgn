package kr.or.yi.foodMgn.handler.login;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Member;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/login.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			
			MemberDao dao = new MemberDaoImpl();
			
			Member member = new Member(name, tel);
			Member member2 = dao.selectByNameTel(member);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(member2 == null) {
				map.put("success", false);
			}else if(member2.isMbWithdrawal()==false) {
				map.put("success", "noMem");
			}else {
				HttpSession session = req.getSession();
				session.setAttribute("Auth", member2.getMbNo());
				map.put("success", true);
			}
			
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
