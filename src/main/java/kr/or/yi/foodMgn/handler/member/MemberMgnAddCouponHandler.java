package kr.or.yi.foodMgn.handler.member;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Coupon;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.MemberPage;

public class MemberMgnAddCouponHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDao dao = new MemberDaoImpl();
		
		String sPage = req.getParameter("page");
		
		int page = 1;
		if(sPage != null) {
			page = Integer.parseInt(sPage);
		}
		
		String c = req.getParameter("coupon");
		String[] noArray = req.getParameterValues("noArray");
		
		Member member = new Member();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("coupon", c);
		
		for(String i: noArray) {
			member.setMbNo(Integer.parseInt(i));
			map.put("mbNo", i);
			
			List<Member> clist = dao.selectCpname(map);
			
			if(clist.size() != 0) {
				Member m = dao.selectByMbNo(member);
				int mileage = m.getMbMileage() + 1000;
				member.setMbMileage(mileage);
				dao.updateMileage(member);
			}else {
				dao.insertCoupon(map);
			}
		}

		Map<String , Integer> map2 = new HashMap<>();
		map2.put("startRow", (page-1)*20);
		map2.put("size", 20);
		
		List<Member> mlist = dao.selectListPage(map2);
		int totalCount = dao.selectTotalCount();
		MemberPage mp = new MemberPage(totalCount, page, 20, mlist);
		
		res.setContentType("application/json;charset=utf-8");
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(mp);
		
		PrintWriter out = res.getWriter();
		out.print(json);
		out.flush();
		
		return null;
	}

}
