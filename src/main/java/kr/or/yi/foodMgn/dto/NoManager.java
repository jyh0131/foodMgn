package kr.or.yi.foodMgn.dto;

public class NoManager {
	private String nmgId;
	private String nmgPwd;
	
	public NoManager() {
	}
	
	public NoManager(String nmgId) {
		this.nmgId = nmgId;
	}

	public String getNmgId() {
		return nmgId;
	}

	public void setNmgId(String nmgId) {
		this.nmgId = nmgId;
	}

	public String getNmgPwd() {
		return nmgPwd;
	}

	public void setNmgPwd(String nmgPwd) {
		this.nmgPwd = nmgPwd;
	}

	@Override
	public String toString() {
		return String.format("NoManager [nmgId=%s, nmgPwd=%s]", nmgId, nmgPwd);
	}
}
