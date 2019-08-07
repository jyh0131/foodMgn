package kr.or.yi.foodMgn.handler.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Member;

public class MemberMgnSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String tel = req.getParameter("tel");
			
			MemberDao dao = new MemberDaoImpl();
			Member mem = new Member();
			mem.setMbTel(tel);
			List<Member> list = dao.selectMemberByTel(mem);
			
			for(Member m : list) {
				System.out.println(m);
			}
			
			if(list != null) {
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list);
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				
				return null;
			}
		}
		return null;
	}

}
