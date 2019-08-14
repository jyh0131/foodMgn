package kr.or.yi.foodMgn.handler.manager;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.yi.foodMgn.controller.CommandHandler;
import kr.or.yi.foodMgn.dao.EventDao;
import kr.or.yi.foodMgn.daoImpl.EventDaoImpl;
import kr.or.yi.foodMgn.dto.Event;

public class EventWriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/manager/smart.jsp";
		}else {
			
			
			ServletContext context = req.getServletContext();
			String uploadPath = context.getRealPath("se2/upload");
			
			File dir = new File(uploadPath);
			
			if(dir.exists()==false) {
				dir.mkdir(); // 폴더생성
			}
			int size = 1024*1024*10;
			
			//동일한 파일을 업로드하면 자동으로 rename됨.
			MultipartRequest multi = new MultipartRequest(req, uploadPath,size, "utf-8", new DefaultFileRenamePolicy()); // 생성자만 호출하면 업로드함.
			
			String title = multi.getParameter("title"); // 게시물 제목
			String content = multi.getParameter("content"); // 게시물 내용
			System.out.println("-----------------------------------------------"+content);
			String mainImg = multi.getFilesystemName("mainImg"); //메인 이미지
			System.out.println("-----------------------------------------------"+mainImg);
			String eName = "관리자"; //관리자
			String date = multi.getParameter("date");
			String date2 = multi.getParameter("date2");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			sd.parse(date);//시작날짜
			sd.parse(date2);//마감날짜
			boolean eIng = true;
			
			
			
			
			Event event = new Event(eName, title, content, mainImg , sd.parse(date), sd.parse(date2), eIng);
			
			
			EventDao eDao = new EventDaoImpl();
			eDao.insertEvent(event);
			
			
			res.sendRedirect(req.getContextPath()+"/event.do");
			return null;
			
		}
		
	}

}
