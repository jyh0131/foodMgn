package kr.or.yi.foodMgn.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Reservation {
	private int rsvNo;
	private int rsvNumber; //인원
	private Date rsvTime; //예약시간
	private Date rsvInputTime;//예약등록시간
	private Date rsvUpdateTime;//수정시간
	private Member mbNo; // 회원번호
	private String rsvTableNo; // 테이블 번호
	private boolean rsvCancel; // 취소 여부. 취소하면 true 평소에 false
	
	
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

	public Reservation(int rsvNumber, Date rsvTime, Date rsvInputTime, Date rsvUpdateTime, Member mbNo,
			String rsvTableNo, boolean rsvCancel) {
		this.rsvNumber = rsvNumber;
		this.rsvTime = rsvTime;
		this.rsvInputTime = rsvInputTime;
		this.rsvUpdateTime = rsvUpdateTime;
		this.mbNo = mbNo;
		this.rsvTableNo = rsvTableNo;
		this.rsvCancel = rsvCancel;
	}




	public Date getRsvInputTime() {
		return rsvInputTime;
	}

	public void setRsvInputTime(Date rsvInputTime) {
		this.rsvInputTime = rsvInputTime;
	}

	public Date getRsvUpdateTime() {
		return rsvUpdateTime;
	}

	public void setRsvUpdateTime(Date rsvUpdateTime) {
		this.rsvUpdateTime = rsvUpdateTime;
	}

	public boolean isRsvCancel() {
		return rsvCancel;
	}

	public void setRsvCancel(boolean rsvCancel) {
		this.rsvCancel = rsvCancel;
	}

	public int getRsvNo() {
		return rsvNo;
	}

	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}

	public int getRsvNumber() {
		return rsvNumber;
	}

	public void setRsvNumber(int rsvNumber) {
		this.rsvNumber = rsvNumber;
	}

	public Date getRsvTime() {
		return rsvTime;
	}

	public void setRsvTime(Date rsvTime) {
		this.rsvTime = rsvTime;
	}

	public Member getMbNo() {
		return mbNo;
	}

	public void setMbNo(Member mbNo) {
		this.mbNo = mbNo;
	}

	public String getRsvTableNo() {
		return rsvTableNo;
	}

	public void setRsvTableNo(String rsvTableNo) {
		this.rsvTableNo = rsvTableNo;
	}

	
	
	@Override
	public String toString() {
		return String.format(
				"Reservation [rsvNo=%s, rsvNumber=%s, rsvTime=%s, rsvInputTime=%s, rsvUpdateTime=%s, mbNo=%s, rsvTableNo=%s, rsvCancel=%s]",
				rsvNo, rsvNumber, rsvTime, rsvInputTime, rsvUpdateTime, mbNo, rsvTableNo, rsvCancel);
	}

	public Object[] toArray() {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd kk:mm");
		String updateTime = "";
		String name = String.format("M%03d", mbNo.getMbNo());
		
		String current = "예약";
		
		if(rsvUpdateTime!=null) {
			updateTime = sd.format(rsvUpdateTime);
		}
		if(mbNo.getMbBirth()==null) {
			name = String.format("N%03d", mbNo.getMbNo());
		}
		if(rsvCancel==true) {
			current = "취소";
		}
		return new Object[]{name, mbNo.getMbName(), mbNo.getMbTel(), rsvNumber+"명", sd.format(rsvTime), rsvTableNo,sd.format(rsvInputTime) , updateTime, current};
	}
	
}
































