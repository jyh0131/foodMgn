package kr.or.yi.foodMgn.handler.notice;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;

public class NoticeMgnInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/manager/community/noticeForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			/*String uploadPath = req.getRealPath("upload");
			
			File dir = new File(uploadPath);
			if(dir.exists() == false) {
				dir.mkdirs();
			}
			
			int size = 1024*1024*100; 
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());*/
			
			NoticeDao dao = new NoticeDaoImpl();
			
			List<Notice> list = dao.selectNoticeByAll();
			
			Notice notice = new Notice(title, content); 
			notice.setNoNo(list.size()+1);
			notice.setNoRegdate(new Date());
			notice.setNoWriter("관리자");
			
			dao.insertNotice(notice);
			
			res.sendRedirect(req.getContextPath()+"/noticeMgnlist.do");
			return null;
		}
		return null;
	}

}
