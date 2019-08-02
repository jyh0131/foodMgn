package kr.or.yi.foodMgn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ConmmandHandler {
	public String process(HttpServletRequest req,HttpServletResponse res) throws Exception;
}
