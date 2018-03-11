package com.kh.pj.board.model.vo;

import java.sql.Date;

public class Attachment {
	private int fNo;
	private int bId;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLelvel;
	private Date uploadDate;
	private String status;
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attachment(int fNo, int bId, String originName, String changeName, String filePath, int fileLelvel,
			Date uploadDate, String status) {
		super();
		this.fNo = fNo;
		this.bId = bId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLelvel = fileLelvel;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLelvel() {
		return fileLelvel;
	}

	public void setFileLelvel(int fileLelvel) {
		this.fileLelvel = fileLelvel;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fNo=" + fNo + ", bId=" + bId + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileLelvel=" + fileLelvel + ", uploadDate=" + uploadDate + ", status="
				+ status + "]";
	}
	
}
