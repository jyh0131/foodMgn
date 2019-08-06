package kr.or.yi.foodMgn.handler.login;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.MemberDao;
import kr.or.yi.foodMgn.dao.NoManagerDao;
import kr.or.yi.foodMgn.daoImpl.MemberDaoImpl;
import kr.or.yi.foodMgn.daoImpl.NoManagerDaoImpl;
import kr.or.yi.foodMgn.dto.Member;
import kr.or.yi.foodMgn.dto.NoManager;

public class JoinFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/joinForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			NoManagerDao dao = new NoManagerDaoImpl();
			MemberDao mDao = new MemberDaoImpl();
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String pw2 = req.getParameter("pw2");
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String birth = req.getParameter("birth");
			String addr = req.getParameter("addr");
			
			NoManager nm = new NoManager(id);
			NoManager nm2 = dao.selectById(nm);
			if(nm2 != null) {
				req.setAttribute("duplicationID", true);
				return "/WEB-INF/view/login/joinForm.jsp";
			}
			
			NoManager noManager = new NoManager();
			noManager.setNmgId(id);
			noManager.setNmgPwd(pw);
			
			dao.insertNoManger(noManager);
			System.out.println(noManager);
			
			SimpleDateFormat sdfm = new SimpleDateFormat("yyyy-mm-dd");
			Date birthDate = sdfm.parse(birth);
			
			Member member = new Member(name, birthDate, tel, addr);
			mDao.insertMember(member);
			
			res.sendRedirect(req.getContextPath()+"/login.do");
			return null;
		}
		return null;
	}

}
