package com.kh.pj.report.model.vo;

import java.sql.Date;

public class Report {
	private int reportNo;
	private int boardNo;
	private Date reportDate;
	private String reportReason;
	private int memberNo;
	
	public Report() {
		super();
	}

	public Report(int reportNo, int boardNo, Date reportDate, String reportReason, int memberNo) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.reportDate = reportDate;
		this.reportReason = reportReason;
		this.memberNo = memberNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNo=" + boardNo + ", reportDate=" + reportDate
				+ ", reportReason=" + reportReason + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
	
}
