package kr.or.yi.foodMgn.dto;

public class Manager {
	private String mgId;
	private String mgPwd;
	
	public Manager() {
	}
	
	public Manager(String mgId) {
		this.mgId = mgId;
	}

	public String getMgId() {
		return mgId;
	}
	public String getMgId2() {
		return "관리자["+mgId+"]";
	}
	public void setMgId(String mgId) {
		this.mgId = mgId;
	}
	public String getMgPwd() {
		return mgPwd;
	}
	public void setMgPwd(String mgPwd) {
		this.mgPwd = mgPwd;
	}
	
	@Override
	public String toString() {
		return String.format("Manager [mgId=%s, mgPwd=%s]", mgId, mgPwd);
	}
}
