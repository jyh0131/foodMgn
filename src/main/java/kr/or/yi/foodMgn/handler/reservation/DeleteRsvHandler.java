package kr.or.yi.foodMgn.handler.reservation;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.ReservationDao;
import kr.or.yi.foodMgn.daoImpl.ReservationDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Reservation;

public class DeleteRsvHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ReservationDao rDao = new ReservationDaoImpl();
		int mbNo = (int) req.getSession().getAttribute("Auth");
		if(req.getMethod().equalsIgnoreCase("get")) {
			int rsvNo = Integer.parseInt(req.getParameter("rsvNo"));
			Date date = new Date();
			Reservation rsv = new Reservation();
			rsv.setRsvNo(rsvNo);
			rsv.setRsvUpdateTime(date);
			rsv.setRsvCancel(true);
			rDao.deleteRsv2(rsv);
			
			Member member = new Member(mbNo);
			List<Reservation> list = rDao.selectByNo(member);	
			res.setContentType("application/json;charset=utf-8");
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list); 
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
		}
		return null;
	}

}
