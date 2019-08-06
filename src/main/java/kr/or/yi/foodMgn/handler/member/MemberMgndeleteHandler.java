package kr.or.yi.foodMgn.handler.member;

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

public class MemberMgndeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int mbNo = Integer.parseInt(req.getParameter("mNo"));
		
		System.out.println(mbNo);
		
		MemberDao dao = new MemberDaoImpl();
		Member member = new Member(mbNo);
		member.setMbWithdrawal(false);
		dao.deleteMember(member);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("success", true);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map);
		
		PrintWriter out = res.getWriter();
		out.print(json);
		out.flush();
		
		return null;
	}

}
