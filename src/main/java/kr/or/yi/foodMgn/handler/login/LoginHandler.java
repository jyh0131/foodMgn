package kr.or.yi.foodMgn.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.User;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/login.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			
			MemberDao dao = new MemberDaoImpl();
			
			Member member = new Member();
			member.setMbName(name);
			member.setMbTel(tel);
			
			Member mem = dao.selectByNameTel(member);
			
			if(mem == null) {
				req.setAttribute("noJoin", true);
				return "/WEB-INF/view/login/login.jsp";
			}
			
			HttpSession session = req.getSession();
			User user = new User(mem.getMbName(), mem.getMbTel());
			session.setAttribute("Auth", user);
			
			res.sendRedirect(req.getContextPath() + "/");
			return null;
		}
		return null;
	}

}
