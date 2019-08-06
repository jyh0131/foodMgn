package kr.or.yi.foodMgn.handler.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dto.Sale;
import kr.or.yi.foodMgn.service.SaleListService;

public class PaymentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		return "/WEB-INF/view/payment/payment.jsp";
	}

}
