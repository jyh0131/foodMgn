package kr.or.yi.foodMgn.handler.payment;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dto.Grade;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Sale;
import kr.or.yi.foodMgn.service.PaymentService;

public class PaymentResultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String saleInfo= req.getParameter("sale_info"); //할인정보
		String salePrice = req.getParameter("sale_price"); //sale_discount_price 할인된금액
		String saleType= req.getParameter("sale_type"); //1이면 현금 0이면 카드
		int iSaleType= Integer.parseInt(saleType);
		PaymentService service = PaymentService.getInstance();
		
		Member mem = new Member(); //멤버 받아오기해야함~
		List<Sale> saleList = new ArrayList<Sale>(); //리스트도 받아야함~~~
		
		
		for(Sale s : saleList) {
			s.setSaleType(iSaleType);
			s.setSaletime(new Date());
			if(mem!=null) {
				s.setMbNo(mem);
				s.setSaleDiscountInfo(saleInfo);
			}
			
		}
		Map<String, List<Sale>> map = new HashMap<>();
		map.put("list", saleList);
		
		
		
		
		if (saleInfo.contains("마일리지") && mem != null) { //마일리지 사용한 회원 결제시
			int info1 = saleInfo.indexOf(":");
			int info2 = saleInfo.indexOf("원");
			String sInfo = salePrice.substring(info1+1, info2) ;
			int infoMileage = Integer.parseInt(sInfo);
			int memMileage = mem.getMbMileage();
			mem.setMbMileage(memMileage-infoMileage); 
			
			service.insertSaleUpdateMileageTransaciton(map, mem);//마일리지 수정이랑  count 1증가
		}else if(mem != null && saleInfo.contains("쿠폰")) { //쿠폰 사용시

			int a = saleInfo.indexOf(":");
			int b = saleInfo.indexOf("(");
			String cou = saleInfo.substring(a+1, b) ;
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("whether", 1);
			map2.put("no", mem.getMbNo());
			map2.put("cpname", cou);
			service.insertSaleUpdateCountUpdateCouponTransaciton(map, mem, map2);
		}
		
		else if (mem == null) { //회원이 아닐시
			service.insertSale(map);
		} else if (mem != null) { //회원인데 마일리지,쿠폰 사용안할시
			
			service.insertSaleUpdateCountTransaciton(map, mem);
		}
		//금액에 따라 등급 변경됨
		
		if(mem!=null) {
			int total = service.totalPrice(mem.getMbNo());
			Member mem2 = new Member(mem.getMbNo());
			if(total > 0 && total <= 299999) {
				mem2.setMbGrade(new Grade("bronze"));
				service.updateGrade(mem2);
			}
			else if(total > 300000 && total <= 499999) {
				mem2.setMbGrade(new Grade("silver"));
				service.updateGrade(mem2);
			}else if(total >500000 && total <=999999) {
				mem2.setMbGrade(new Grade("gold"));
			}else if(total > 1000000) {
				mem2.setMbGrade(new Grade("vip"));
			}
			service.updateGrade(mem2);
		}
		
		
		res.sendRedirect(req.getContextPath()+"/");
		return null; //프로젝트 루트로 이동 - index.jsp실행 //제일앞에있는 /(슬러시)를 갈아엎음
	}

}
