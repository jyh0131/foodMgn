package kr.or.yi.foodMgn.dto;

public class User {
	private String uName;
	private String uTel;
	private boolean uIsMgr;
	
	public User() {
	}
	
	public User(String uName, String uTel) {
		super();
		this.uName = uName;
		this.uTel = uTel;
	}

	public User(String uName, String uTel, boolean uIsMgr) {
		super();
		this.uName = uName;
		this.uTel = uTel;
		this.uIsMgr = uIsMgr;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuTel() {
		return uTel;
	}

	public void setuTel(String uTel) {
		this.uTel = uTel;
	}

	public boolean isuIsMgr() {
		return uIsMgr;
	}

	public void setuIsMgr(boolean uIsMgr) {
		this.uIsMgr = uIsMgr;
	}

	@Override
	public String toString() {
		return "User [uName=" + uName + ", uTel=" + uTel + ", uIsMgr=" + uIsMgr + "]";
	}

}
