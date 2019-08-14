package kr.or.yi.foodMgn.handler.mypage;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.PaymentDao;
import kr.or.yi.foodMgn.daoImpl.PaymentDaoImpl;
import kr.or.yi.foodMgn.dto.Payment;

public class MypageSaleListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PaymentDao dao = new PaymentDaoImpl();
		int no = (int) req.getSession().getAttribute("Auth");
		
		if(req.getMethod().equalsIgnoreCase("get")) {
			List<Payment> list = dao.selectPaymentByAll2(no);
			req.setAttribute("list", list);
			return "/WEB-INF/view/mypage/mypay.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String date = req.getParameter("date");
			String date2 = req.getParameter("date2");
			
			if(date!=null) {
				Map<String, Object> map2 = new HashMap<>();
				map2.put("no", no);
				map2.put("date", date);
				map2.put("date2", date2);
				List<Payment> list = dao.selectPaytmentByDateRange2(map2);
				Map<String, List<Payment>> map = new HashMap<>();
				map.put("list", list);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map); 
				res.setContentType("apllication/json;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				
				return null;
			}else {
				List<Payment> list = dao.selectPaymentByAll2(no);
				Map<String, List<Payment>> map = new HashMap<>();
				map.put("list", list);
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map); 
				res.setContentType("apllication/json;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
				
				return null;
			}
		}
		return null;
	}

}
