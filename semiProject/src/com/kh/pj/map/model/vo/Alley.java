package com.kh.pj.map.model.vo;

public class Alley {
	private int alleytrdar_no;
	private String alleytrdar_nm;
	private int signgucd;
	private String signgucd_nm;
	private int adstrdcd;
	private String adstrdcd_nm;
	
	public Alley() {
		// TODO Auto-generated constructor stub
	}

	public Alley(int alleytrdar_no, String alleytrdar_nm, int signgucd, String signgucd_nm, int adstrdcd,
			String adstrdcd_nm) {
		super();
		this.alleytrdar_no = alleytrdar_no;
		this.alleytrdar_nm = alleytrdar_nm;
		this.signgucd = signgucd;
		this.signgucd_nm = signgucd_nm;
		this.adstrdcd = adstrdcd;
		this.adstrdcd_nm = adstrdcd_nm;
	}

	@Override
	public String toString() {
		return "Alley [alleytrdar_no=" + alleytrdar_no + ", alleytrdar_nm=" + alleytrdar_nm + ", signgucd=" + signgucd
				+ ", signgucd_nm=" + signgucd_nm + ", adstrdcd=" + adstrdcd + ", adstrdcd_nm=" + adstrdcd_nm + "]";
	}

	public int getAlleytrdar_no() {
		return alleytrdar_no;
	}

	public void setAlleytrdar_no(int alleytrdar_no) {
		this.alleytrdar_no = alleytrdar_no;
	}

	public String getAlleytrdar_nm() {
		return alleytrdar_nm;
	}

	public void setAlleytrdar_nm(String alleytrdar_nm) {
		this.alleytrdar_nm = alleytrdar_nm;
	}

	public int getSigngucd() {
		return signgucd;
	}

	public void setSigngucd(int signgucd) {
		this.signgucd = signgucd;
	}

	public String getSigngucd_nm() {
		return signgucd_nm;
	}

	public void setSigngucd_nm(String signgucd_nm) {
		this.signgucd_nm = signgucd_nm;
	}

	public int getAdstrdcd() {
		return adstrdcd;
	}

	public void setAdstrdcd(int adstrdcd) {
		this.adstrdcd = adstrdcd;
	}

	public String getAdstrdcd_nm() {
		return adstrdcd_nm;
	}

	public void setAdstrdcd_nm(String adstrdcd_nm) {
		this.adstrdcd_nm = adstrdcd_nm;
	}
	
	
}
