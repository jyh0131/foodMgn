package kr.or.yi.foodMgn.handler.salesList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dto.SalesStatus;
import kr.or.yi.foodMgn.service.SalesListService;

public class SalesListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SalesListService service = SalesListService.getInstance();
		List<SalesStatus> list = service.selectSalesStatusByAll();
		int count = list.size();
		req.setAttribute("count", count);
		req.setAttribute("list", list);
		return "/WEB-INF/manager/list/salesList.jsp";
	}

}
