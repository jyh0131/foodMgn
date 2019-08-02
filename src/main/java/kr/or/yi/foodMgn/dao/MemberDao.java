package kr.or.yi.foodMgn.dao;

import java.util.List;
import java.util.Map;

import kr.or.yi.foodMgn.dto.Member;

public interface MemberDao {
	public List<Member> selectMemberByAll();
	public int insertMember(Member member);
	public List<Member> selectMemberByTel(Member member);
	public int updateMember(Member member);
	public int deleteMember(Member member);
	public List<Member> selectMemberByNo(Member member);
	public Member selectByTel(int tel);
	public int mileageUpdate(Member member);
	public int couponDelete(Map<String, Object> map);
	public Member selectByNameTel(Member member);
	public List<Member> selectMemberByAllNM();
	
	public int updateTrnasMember(Member member);
	public int updateGrade(Member mem);
	public Member selectCouponByTel(int tel);
}
