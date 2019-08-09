package kr.or.yi.foodMgn.handler.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.PaymentDao;
import kr.or.yi.foodMgn.daoImpl.PaymentDaoImpl;
import kr.or.yi.foodMgn.dto.Payment;
import kr.or.yi.foodMgn.service.SaleListService;

public class MypageSaleListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PaymentDao dao = new PaymentDaoImpl();
		int no = (int) req.getSession().getAttribute("Auth");
		List<Payment> list = dao.selectPaymentByAll2(no);
		req.setAttribute("list", list);
		return "/WEB-INF/view/mypage/mypay.jsp";
	}

}
