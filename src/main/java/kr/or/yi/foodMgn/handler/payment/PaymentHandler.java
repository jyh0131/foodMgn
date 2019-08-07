package kr.or.yi.foodMgn.handler.payment;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.FoodDao;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.dao.SaleDao;
import kr.or.yi.foodMgn.daoImpl.FoodDaoImpl;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.daoImpl.SaleDaoImpl;
import kr.or.yi.foodMgn.dto.Coupon;
import kr.or.yi.foodMgn.dto.Food;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Sale;

public class PaymentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			String food = req.getParameter("foodNo");
			String foodCount = req.getParameter("foodCount");
			
			String totalPrice = req.getParameter("total"); // 총 가격
			
			String foodNo[] = food.split("-");
			String foodC[] = foodCount.split("-");
			
			List<String> foodList = new ArrayList<String>(); // 음식 번호
			List<String> foodCList = new ArrayList<String>(); // 음식 수량
			
			for(int i=0; i<foodNo.length; i++) {
					foodList.add(foodNo[i]);
					foodCList.add(foodC[i]);
			}
			
			int Number = 0;
			SaleDao sDao = new SaleDaoImpl();
			Sale sale = sDao.selectLastNo();
			FoodDao fDao = new FoodDaoImpl();
			if(sale==null) {
				Number = 1;
			}else {
				Number = sale.getSaleNo()+1; // 판매번호
			}
			
			List<Food> foodList1 = new ArrayList<>(); // 주문한 음식 리스트.
			
			for(int i=0; i<foodList.size(); i++) {
				Food food1 = new Food();
				food1.setCount(Integer.parseInt(foodCList.get(i)));
				food1.setFdNo(Integer.parseInt(foodList.get(i))); // food객체에 food번호랑 갯수만.
				Food food2 = fDao.selectByFdNo(food1);
				food1.setFdPrice(food2.getFdPrice()); // food의 개별 가격
				food1.setFdName(food2.getFdName()); // food의 이름.
				foodList1.add(food1); 
			}
			List<Sale> saleList = new ArrayList<Sale>();
			for(Food food2 : foodList1) {
				Sale sale2 = new Sale();
				int foodCount2 = food2.getCount();
				sale2.setSaleNo(Number);
				sale2.setSaleOrderCnt(foodCount2);
				sale2.setSaleOrderKind(false);
				sale2.setFdNo(food2);
				saleList.add(sale2);
			}
			
			
			req.setAttribute("totalPrice", totalPrice);
			req.getSession().setAttribute("list", saleList);
			int mbNo = (int) req.getSession().getAttribute("Auth");
			MemberDao mDao = new MemberDaoImpl();
			Member m = new Member(mbNo);
			Member mem = mDao.selectByMbNo2(m);
			String sTel = mem.getMbTel();
			String sTel2 = sTel.substring(3);
			int tel = Integer.parseInt(sTel2);
			Member mCoupon = mDao.selectCouponByTel(tel);
			try {
				List<Coupon> couponList = mCoupon.getCoupon();
				req.setAttribute("couponList", couponList);
			} catch (NullPointerException e) {
				req.setAttribute("couponList", false);
			}
			
			req.getSession().setAttribute("mem", mem);
		}
		return "/WEB-INF/view/payment/payment.jsp";
	}

}
