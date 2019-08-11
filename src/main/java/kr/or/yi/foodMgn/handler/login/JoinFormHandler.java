package kr.or.yi.foodMgn.handler.login;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberCouponDao;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.daoImpl.MemberCouponDaoImpl;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.dto.Coupon;
import kr.or.yi.foodMgn.dto.Grade;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.MemberCoupon;

public class JoinFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/joinForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			MemberDao dao = new MemberDaoImpl();
			MemberCouponDao mcDao = new MemberCouponDaoImpl();
			
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String birth = req.getParameter("birth");
			String addr = req.getParameter("addr");
			
			SimpleDateFormat sdfm = new SimpleDateFormat("yyyy-MM-dd");
			Date birthDate = sdfm.parse(birth);
			
			List<Member> list = dao.selectMemberByAllNM();
			int no = list.size()+1;
			
			Member mem = new Member();
			mem.setMbTel(tel);
			Member mem2 = dao.selectByTelForJoin(mem);
			
			Map<String, Object> map = new HashMap<String, Object>();
			if(mem2 == null) {
				Member member = new Member(name, birthDate, tel, addr);
				member.setMbNo(no);
				member.setMbMileage(1000);
				member.setMbGrade(new Grade("bronze"));
				member.setMbJoin(new Date());
				member.setMbWithdrawal(true);
				dao.insertMember(member);
				
				Coupon coupon = new Coupon("회원가입쿠폰");
				
				MemberCoupon mc = new MemberCoupon(coupon, member);
				mcDao.insertMemberCoupon(mc);
				
				System.out.println(mc);
				
				map.put("joinSuccess", true);
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				//res.sendRedirect(req.getContextPath()+"/login.do");
				return null;
			}else {
				if(mem2.isMbWithdrawal() == false) {
					mem2.setMbName(name);
					mem2.setMbTel(tel);
					mem2.setMbBirth(birthDate);
					mem2.setMbAddress(addr);
					mem2.setMbMileage(1000);
					mem2.setMbGrade(new Grade("bronze"));
					mem2.setMbJoin(new Date());
					mem2.setMbWithdrawal(true);
					
					dao.updateTrnasMember(mem2);
					
					map.put("transMem", true);
					res.setContentType("application/json;charset=utf-8");
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(map);
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					
					return null;
				}else {
					map.put("joinSuccess", false);
					res.setContentType("application/json;charset=utf-8");
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(map);
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					
					//return "/WEB-INF/view/login/login.jsp";
					return null;
				}
			}
		}
		return null;
	}

}
