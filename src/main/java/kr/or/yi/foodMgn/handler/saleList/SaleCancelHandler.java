package kr.or.yi.foodMgn.handler.saleList;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dto.Grade;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Payment;
import kr.or.yi.foodMgn.service.SaleListService;

public class SaleCancelHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SaleListService service = SaleListService.getInstance();
		String payNo = req.getParameter("payNo");
		String payDiscountInfo = req.getParameter("payDiscountInfo");
		String payDiscountPrice = req.getParameter("payDiscountPrice");
		String payMember = req.getParameter("payMember");
		String payCancel = req.getParameter("payCancel");
		String payMemberNo = req.getParameter("payMemberNo");

		Member member = null;
		System.out.println(payCancel);
		Payment pay = new Payment();
		pay.setPayNo(Integer.parseInt(payNo));
		pay.setPayDiscountInfo(payDiscountInfo);
		pay.setPayDiscountPrice(Integer.parseInt(payDiscountPrice));
		pay.setPayMember(payMember);
		pay.setPayMemberNo(Integer.parseInt(payMemberNo));
		System.out.println(Integer.parseInt(payMemberNo));
		System.out.println(pay.getPayMemberNo());
		if (payCancel.equals("결제완료")) {
			pay.setPayCancel(0);
		} else {
			pay.setPayCancel(1);
		}
		System.out.println(pay.getPayCancel());
		if (pay.getPayCancel() == 0) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("cancel", 1);
			map.put("no", pay.getPayNo());
			if (pay.getPayMember().equals("비회원")) { // 비회원일 경우
				service.updateSaleByCancel(map);// sale테이블의 sale_cancel를 1(true)로 바꿈
			} else { // 회원일 경우(마일리지)
				member = new Member();
				member.setMbNo(pay.getPayMemberNo());
				member.setMbMileage(pay.getPayDiscountPrice());
				String cou = "";
				String info = pay.getPayDiscountInfo();
				if(info.contains("등급")) {
					service.updateCancel(map, member);
				}else {
					int a = info.indexOf(":");
					int b = info.indexOf("(");

					try { // 쿠폰 or 마일리지 사용일경우
						cou = info.substring(a + 1, b);
						System.out.println(cou);
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("whether", 0);
						map2.put("no", pay.getPayMemberNo());
						map2.put("cpname", cou);
						service.updateCancelUpdateMileageCoupon(map, member, map2); // sale테이블의 sale_cancel를 1(true)로
																					// 바꿈/마일리지 원상복귀/count -1/쿠폰 복귀
					} catch (StringIndexOutOfBoundsException e2) { // 쿠폰사용 x or 마일리지x 경우
						cou = "";
						service.updateCancelUpdateMileage(map, member); // sale테이블의 sale_cancel를 1(true)로 바꿈/마일리지
																		// 원상복귀/count -1/쿠폰 복귀
					}
				}
				

				// 등급 변경
				try {
	                  int total = service.totalPrice(pay.getPayMemberNo());
	                  Member mem2 = new Member(pay.getPayMemberNo());

	                  if (total > 0 && total <= 299999) { // 등급 변경
	                     mem2.setMbGrade(new Grade("bronze"));
	                     service.updateGrade(mem2);
	                  } else if (total > 300000 && total <= 499999) {
	                     mem2.setMbGrade(new Grade("silver"));
	                     service.updateGrade(mem2);
	                  } else if (total > 500000 && total <= 999999) {
	                     mem2.setMbGrade(new Grade("gold"));
	                  } else if (total > 1000000) {
	                     mem2.setMbGrade(new Grade("vip"));
	                  }
	                  service.updateGrade(mem2);
	               } catch (NullPointerException e2) {
	                  
	               }
			}

		}

		List<Payment> list = service.selectPaymentByAll();
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
