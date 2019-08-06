package kr.or.yi.foodMgn.handler.login;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Grade;
import kr.or.yi.foodMgn.dto.Member;

public class JoinFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/joinForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			MemberDao dao = new MemberDaoImpl();
			
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String birth = req.getParameter("birth");
			String addr = req.getParameter("addr");
			
			List<Member> list = dao.selectMemberByAllNM();
			int no = list.size();
			
			Member mem = new Member();
			mem.setMbTel(tel);
			Member mem2 = dao.selectByNameTel(mem);
			
			if(mem2 == null) {
				SimpleDateFormat sdfm = new SimpleDateFormat("yyyy-mm-dd");
				Date birthDate = sdfm.parse(birth);
				
				Member member = new Member(name, birthDate, tel, addr);
				member.setMbNo(no);
				member.setMbMileage(1000);
				member.setMbGrade(new Grade("bronze"));
				member.setMbJoin(new Date());
				member.setMbWithdrawal(true);
				
				dao.insertMember(member);
				res.sendRedirect(req.getContextPath()+"/login.do");
				return null;
			}else {
				return "/WEB-INF/view/login/login.jsp";
			}
		}
		return null;
	}

}
