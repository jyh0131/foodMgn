package kr.or.yi.foodMgn.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class NullHandler implements ConmmandHandler { //없는 커맨드가 들어오면 이클래스가 실행됨

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.sendError(HttpServletResponse.SC_NOT_FOUND);//404에러를 발생시킴
		return null;
	}



}
