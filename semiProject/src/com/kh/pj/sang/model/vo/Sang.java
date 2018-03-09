package com.kh.pj.sang.model.vo;

public class Sang {
	private int analysisNo;
	private int memberNo;
	private String range;
	private String category;
	private String address;
	private String coordinate;
	
	public Sang() {
		super();
	}

	public Sang(int analysisNo, int memberNo, String range, String category, String address, String coordinate) {
		super();
		this.analysisNo = analysisNo;
		this.memberNo = memberNo;
		this.range = range;
		this.category = category;
		this.address = address;
		this.coordinate = coordinate;
	}

	public int getAnalysisNo() {
		return analysisNo;
	}

	public void setAnalysisNo(int analysisNo) {
		this.analysisNo = analysisNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCoordinate() {
		return coordinate;
	}

	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}

	@Override
	public String toString() {
		return "Sang [analysisNo=" + analysisNo + ", memberNo=" + memberNo + ", range=" + range + ", category="
				+ category + ", address=" + address + ", coordinate=" + coordinate + "]";
	}
	
	
	
	
}
