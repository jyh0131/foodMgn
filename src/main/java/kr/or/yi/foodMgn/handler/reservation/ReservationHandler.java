package kr.or.yi.foodMgn.handler.reservation;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.dao.ReservationDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.daoImpl.ReservationDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.Reservation;
import kr.or.yi.foodMgn.dto.User;

public class ReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String isLogin = req.getParameter("isLogin");
			req.setAttribute("isLogin", isLogin);
			if(isLogin.equals("1")) { // 회원일때
				HttpSession session = req.getSession();
				int mbNo = (int) session.getAttribute("Auth");
				Member member = new Member(mbNo);
				MemberDao dao = new MemberDaoImpl();
				Member sMember = dao.selectByMbNo(member);
				
				req.setAttribute("member", sMember);
				
				return "/WEB-INF/view/reservation/reservation.jsp";
				
			}else {//비회원일때
				return "/WEB-INF/view/reservation/reservation.jsp";
			}
				
		}else {
			MemberDao mDao = new MemberDaoImpl();
			ReservationDao rDao = new ReservationDaoImpl();
			String name = req.getParameter("name"); // 이름
			String first = req.getParameter("first"); // 전화번호
			String second = req.getParameter("second");
			String third = req.getParameter("third");
			String tableNo = req.getParameter("tableNo"); // 테이블번호
			int number = Integer.parseInt(req.getParameter("number")); // 예약인원
			String date = req.getParameter("date"); // 날짜
			String hour = req.getParameter("hour"); // 시간
			String minutes = req.getParameter("minutes"); // 분
			int isLogin = Integer.parseInt(req.getParameter("isLogin")); //로그인 했는지 안했는지
			
			String dateTime = date+" "+hour+":"+minutes;
			
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd kk:mm");
			Date inputTime = sd.parse(dateTime); // 예약한 날짜
			Member member = new Member(name, first+second+third);
			Member member2 = mDao.selectByNameTel(member); // 입력한 정보로 회원인지 아닌지 검색.
			
			
			//예약 테이블에 들어가야 하는것. 예약번호(자동증가함), 인원, 시간(ex>2019-08-02 13:00), 테이블번호, 등록날짜(지금시간), 취소여부(처음엔 false)
			Reservation rsv = new Reservation(number, inputTime, new Date(), null, member2, tableNo, false);
			
			List<Reservation> list = rDao.selectByRangeTime(rsv); // 예약가능한지 검색.
			
			for(Reservation rssv : list) {
				if(rssv.getRsvTableNo().equals(tableNo)) {
					req.setAttribute("isRsv", false); // 그 시간에 그 테이블에 예약되어있어서 예약안됨.
					req.setAttribute("rsv", rsv);
					return "/WEB-INF/view/reservation/SuccessReservation.jsp";
				}
			}
			if(member2!=null) {//회원인 경우
				rDao.insertRsv(rsv);
				req.setAttribute("isRsv", true);
				req.setAttribute("rsv", rsv);
				return "/WEB-INF/view/reservation/SuccessReservation.jsp";
			}else { // 비회원인 경우
					int a = mDao.selectMemberByAll().size();
					member.setMbNo(a);
					mDao.insertMember(member); // 비회원으로 회원테이블에 저장.
					rsv = new Reservation(number, inputTime, new Date(), null, member, tableNo, false);
					rDao.insertRsv(rsv);
					req.setAttribute("isRsv", true); 
					req.setAttribute("rsv", rsv);
					return "/WEB-INF/view/reservation/SuccessReservation.jsp";
			}
			
		}
		
	}

}
