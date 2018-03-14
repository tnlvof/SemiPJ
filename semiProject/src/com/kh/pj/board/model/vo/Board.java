package com.kh.pj.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	private int bId;
	private String bTitle;
	private Date bDate;
	private String bText;
	private int mNo;
	private String bCategory;
	private int vCount;
	private int pNo;
	private String adopt;
	private String status;
	private int bNo;
	private int recCount;
	private int refLevel;
	private String bPassword;
	private String bWriter;
	
	public Board() {}

	public Board(int bId, String bTitle, Date bDate, String bText, int mNo, String bCategory, int vCount, int pNo,
			String adopt, String status, int bNo, int recCount, int refLevel, String bPassword, String bWriter) {
		super();
		this.bId = bId;
		this.bTitle = bTitle;
		this.bDate = bDate;
		this.bText = bText;
		this.mNo = mNo;
		this.bCategory = bCategory;
		this.vCount = vCount;
		this.pNo = pNo;
		this.adopt = adopt;
		this.status = status;
		this.bNo = bNo;
		this.recCount = recCount;
		this.refLevel = refLevel;
		this.bPassword = bPassword;
		this.bWriter = bWriter;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbText() {
		return bText;
	}

	public void setbText(String bText) {
		this.bText = bText;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public int getvCount() {
		return vCount;
	}

	public void setvCount(int vCount) {
		this.vCount = vCount;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getAdopt() {
		return adopt;
	}

	public void setAdopt(String adopt) {
		this.adopt = adopt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getRecCount() {
		return recCount;
	}

	public void setRecCount(int recCount) {
		this.recCount = recCount;
	}

	public int getRefLevel() {
		return refLevel;
	}

	public void setRefLevel(int refLevel) {
		this.refLevel = refLevel;
	}

	public String getbPassword() {
		return bPassword;
	}

	public void setbPassword(String bPassword) {
		this.bPassword = bPassword;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bTitle=" + bTitle + ", bDate=" + bDate + ", bText=" + bText + ", mNo=" + mNo
				+ ", bCategory=" + bCategory + ", vCount=" + vCount + ", pNo=" + pNo + ", adopt=" + adopt + ", status="
				+ status + ", bNo=" + bNo + ", recCount=" + recCount + ", refLevel=" + refLevel + ", bPassword="
				+ bPassword + ", bWriter=" + bWriter + "]";
	}
	
	
		
}
