package kr.or.yi.foodMgn.handler.reservation;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.dao.ReservationDao;
import kr.or.yi.foodMgn.dao.ReservationDaoTest;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.daoImpl.ReservationDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Reservation;

public class SearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/reservation/search.jsp";
		}else {
			MemberDao mDao = new MemberDaoImpl();
			ReservationDao rDao = new ReservationDaoImpl();
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			Member member2 = new Member(name, tel);
			Member member = mDao.selectByNameTel(member2);
			
			if(member==null) {//예약정보없음
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(false); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			}else {
				List<Reservation> list = rDao.selectByNo(member);
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			}
		}
		return null;
	}

}
