package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.NoManager;

public interface NoManagerDao {
	
	public NoManager selectByPass(NoManager noManager);
	public int insertNoManger(NoManager noManager); 
	public List<NoManager> selectByAll();
	public NoManager selectById(NoManager noManager);
}	
