package kr.or.yi.foodMgn.handler.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Member;

public class MemberMgnListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDao mDao = new MemberDaoImpl();
		
		List<Member> mlist = mDao.selectMemberByAllNM();
		req.setAttribute("mList", mlist);
		
		return "/WEB-INF/view/member/member_mgn.jsp";
	}

}
