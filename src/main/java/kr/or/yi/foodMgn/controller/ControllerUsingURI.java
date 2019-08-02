package kr.or.yi.foodMgn.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ControllerUsingURI extends HttpServlet {
	private HashMap<String, ConmmandHandler> commandHandlerMap = new HashMap<>();

	@Override
	public void init() throws ServletException { //서버가 알아서 호출해줌
		String configFile = getInitParameter("configFile"); //web.xml에 잇는 confile의 값을 들고옴 //property파일의 경로
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile); //상대주소를 절대주소로(읽을수있음)

		try (FileReader fis = new FileReader(configFilePath)) { //까서 읽음
			prop.load(fis); //properties클래스에 읽은 내용을 집어넣음
		} catch (Exception e) {
			throw new ServletException();
		}
		Iterator keyIter = prop.keySet().iterator();
		///simple.do =MVC.simple.SimpleHandler 키 = 값
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next(); //키 추출 : simple.do
			String handlerClassName = prop.getProperty(command); //키에 해당하는 값 : MVC.simple.SimpleHandler
			Class<?> handlerClass; //클래스이름이 무슨클래슨지 모를때
			try {
				handlerClass = Class.forName(handlerClassName); //String으로 되어있는 이름를 class화 시킴
				ConmmandHandler handlerInstance = (ConmmandHandler) handlerClass.newInstance(); //new : 메모리에 올림
				commandHandlerMap.put(command, handlerInstance); //해해쉬맵에 집어넣음 / 키(simple.do):값(new 한 클래스) 
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String command = req.getRequestURI();// 주소가 넘어옴 : /MVC/simple.do 
		if (command.indexOf(req.getContextPath()) == 0) { //프로젝트 이름만 /MVC  
			command = command.substring(req.getContextPath().length()); // /simple.do 
		}

		ConmmandHandler handler = commandHandlerMap.get(command); 
		if (handler == null) { //커맨드가 없으면
			handler = new NullHandler(); //널핸들러
		}
		String viewPage = null;

		try {
			viewPage = handler.process(req, res); //simple.do
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (viewPage != null) { //이동함
			RequestDispatcher dispathcer = req.getRequestDispatcher(viewPage); 
			dispathcer.forward(req, res);
		}

	}

}
