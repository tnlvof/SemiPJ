package com.kh.pj.point.model.vo;

import java.sql.Date;

public class Point implements java.io.Serializable{
	private int pointNo;
	private int memberNo;
	private String pointCode;
	private Date pointDate;
	private int total;
	private String reason;
	private String category;
	
	public Point() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Point(int pointNo, int memberNo, String pointCode, Date pointDate, int total, String reason,
			String category) {
		super();
		this.pointNo = pointNo;
		this.memberNo = memberNo;
		this.pointCode = pointCode;
		this.pointDate = pointDate;
		this.total = total;
		this.reason = reason;
		this.category = category;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getPointCode() {
		return pointCode;
	}

	public void setPointCode(String pointCode) {
		this.pointCode = pointCode;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", memberNo=" + memberNo + ", pointCode=" + pointCode + ", pointDate="
				+ pointDate + ", total=" + total + ", reason=" + reason + ", category=" + category + "]";
	}
	
}
