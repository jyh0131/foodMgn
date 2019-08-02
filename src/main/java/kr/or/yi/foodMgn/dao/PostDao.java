package kr.or.yi.foodMgn.dao;

import java.util.List;

import kr.or.yi.foodMgn.dto.Post;

public interface PostDao {
	List<Post> selectBySiGunGu(Post post);
	List<Post> selectByDoro(Post post);
	List<Post> selectBySiGunGuDoroAddr1(Post post);
	List<Post> selectBySiGunGuDoroAddr1Addr2(Post post);
}
