package kr.or.yi.foodMgn.handler.saleList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dto.Payment;
import kr.or.yi.foodMgn.service.SaleListService;

public class SaleListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			SaleListService service = SaleListService.getInstance();
			List<Payment> list = service.selectPaymentByAll();
			req.setAttribute("list", list);
			return "/WEB-INF/manager/list/saleList.jsp";
		}else {
			boolean a = (boolean) req.getSession().getAttribute("Mgn");
			
			if(a==false) {
				return "/WEB-INF/view/manager/managerLogin.jsp";
			}else {
				SaleListService service = SaleListService.getInstance();
				List<Payment> list = service.selectPaymentByAll();
				req.setAttribute("list", list);
				return "/WEB-INF/manager/list/saleList.jsp";
			}
		}
			
		
	}

}
