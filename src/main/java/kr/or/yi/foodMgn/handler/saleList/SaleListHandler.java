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
		SaleListService service = SaleListService.getInstance();
		List<Payment> list = service.selectPaymentByAll();
		req.setAttribute("list", list);
		return "/WEB-INF/manager/list/saleList.jsp";
	}

}
