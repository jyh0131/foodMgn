package kr.or.yi.foodMgn.handler.manager;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
				String date2 = req.getParameter("date2");
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("date", date);
				map.put("date2", date2);
				List<Reservation> list = rDao.selectByRangeDate(map);
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
			}else if(kind.equals("today")) {
				List<Reservation> list = rDao.selectByTime();
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			}else if(kind.equals("all")) {
				List<Reservation> list = rDao.selectByAll();
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			}else if(kind.equals("cancel")) {
				int rsvNo = Integer.parseInt(req.getParameter("rsvNo"));
				Date date = new Date();
				Reservation rsv = new Reservation();
				rsv.setRsvNo(rsvNo);
				rsv.setRsvUpdateTime(date);
				rsv.setRsvCancel(true);
				rDao.deleteRsv2(rsv);
				
				List<Reservation> list = rDao.selectByAll();
				res.setContentType("application/json;charset=utf-8");
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list); 
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			}else if(kind.equals("update")) {
				int rsvNo = Integer.parseInt(req.getParameter("rsvNo"));
				String date = req.getParameter("date");
				int atNumber = Integer.parseInt(req.getParameter("atNumber"));
				String atTable = "no."+req.getParameter("atTable");
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd kk:mm");
				
				Reservation rsv = new Reservation();
				rsv.setRsvTableNo(atTable);
				rsv.setRsvTime(sd.parse(date));
				Reservation result = rDao.selectByTimeTable(rsv);
				
				if(result!=null && result.getRsvNo()!=rsvNo) { // 예약한 시간과 자리에 다른예약이 있는경우.
					res.setContentType("application/json;charset=utf-8");
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString("0"); 
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
				}else {
					Map<String, Object> map = new HashMap<>();
					map.put("rsvNo", rsvNo);
					map.put("rsvTime", sd.parse(date));
					map.put("rsvNumber", atNumber);
					map.put("rsvTableNo", atTable);
					map.put("rsvUpdateTime", new Date());
					rDao.updateRsv2(map);
					
					List<Reservation> list = rDao.selectByAll();
					res.setContentType("application/json;charset=utf-8");
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(list); 
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
				}
				
				
				
			}
			
		}
		return null;
	}

}
