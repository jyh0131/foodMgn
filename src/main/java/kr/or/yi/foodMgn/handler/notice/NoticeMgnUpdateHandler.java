package kr.or.yi.foodMgn.handler.notice;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.NoticeDao;
import kr.or.yi.foodMgn.daoImpl.NoticeDaoImpl;
import kr.or.yi.foodMgn.dto.Notice;

public class NoticeMgnUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			int no = Integer.parseInt(req.getParameter("no"));
			
			NoticeDao dao = new NoticeDaoImpl();
			Notice n = new Notice(no);
			
			Notice notice = dao.selectNoticeByNo(n);
			
			req.setAttribute("notice", notice);
			
			//req.setAttribute("page", req.getParameter("page"));
			
			return "/WEB-INF/manager/community/noticeUpdate.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String file = req.getParameter("file");
			
			String uploadPath = req.getRealPath("upload");
			
			File dir = new File(uploadPath);
			if(dir.exists() == false) {
				dir.mkdirs();
			}
			
			int size = 1024*1024*100; 
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			
			String fileRename = multi.getFilesystemName("file");
			int no = Integer.parseInt(multi.getParameter("no"));
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			
			req.setAttribute("fileRename", fileRename);
			
			NoticeDao dao = new NoticeDaoImpl();
			
			Notice notice = new Notice(no);
			notice.setNoTitle(title);
			notice.setNoContent(content);
			notice.setNoModdate(new Date());
			dao.updateNotice(notice);
			
			res.sendRedirect(req.getContextPath()+"/mgn/noticeMgnlist.do");
			return null;
		}
		return null;
	}

}
