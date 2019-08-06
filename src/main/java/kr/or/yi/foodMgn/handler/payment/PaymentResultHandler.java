package kr.or.yi.foodMgn.handler.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;

public class PaymentResultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String saleInfo= req.getParameter("sale_info");
		String sale_price = req.getParameter("sale_price");
		
		System.out.println(saleInfo);
		System.out.println(sale_price);
		
		res.sendRedirect(req.getContextPath()+"/");
		return null; //프로젝트 루트로 이동 - index.jsp실행 //제일앞에있는 /(슬러시)를 갈아엎음
	}

}
