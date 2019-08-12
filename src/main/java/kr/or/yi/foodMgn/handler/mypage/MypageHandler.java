package kr.or.yi.foodMgn.handler.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
		}
		return null;
	}

}
