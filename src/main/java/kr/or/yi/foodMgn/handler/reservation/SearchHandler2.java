package kr.or.yi.foodMgn.handler.reservation;

import java.io.PrintWriter;
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

public class SearchHandler2 implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ReservationDao dao = new ReservationDaoImpl();
		int mbNo = (int) req.getSession().getAttribute("Auth");
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			Member member = new Member(mbNo);
			List<Reservation> list = dao.selectByNo(member);	
			req.setAttribute("list", list);
			return "/WEB-INF/view/mypage/myrsv.jsp";
		}else {
			String date = req.getParameter("date");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("date", date);
			map.put("mbNo", mbNo);
			List<Reservation> list = dao.selectByDateNo(map);
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
