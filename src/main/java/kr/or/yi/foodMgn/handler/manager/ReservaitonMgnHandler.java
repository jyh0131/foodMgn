package kr.or.yi.foodMgn.handler.manager;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.ReservationDao;
import kr.or.yi.foodMgn.daoImpl.ReservationDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Reservation;

public class ReservaitonMgnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			ReservationDao rDao = new ReservationDaoImpl();
			List<Reservation> list = rDao.selectByTime(); //취소안한 오늘 남은 예약인원
			req.setAttribute("list", list);
			return "/WEB-INF/manager/reservation/reservation.jsp";
		}else {
			ReservationDao rDao = new ReservationDaoImpl();
			String kind = req.getParameter("kind");
			
			if(kind.equals("date")) {
				String date = req.getParameter("date");
				List<Reservation> list = rDao.selectByDate(date);
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			
			}else if(kind.equals("tel")) {
				String tel = req.getParameter("tel");
				Member member = new Member();
				member.setMbTel(tel);
				List<Reservation> list = rDao.selectByTel(member);
				res.setContentType("application/json;charset=utf-8");
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
