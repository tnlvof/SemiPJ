package com.kh.pj.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	private int boardNo;
	private String title;
	private String password;
	private String content;
	private Date enrollDate;
	private Date modifyDate;
	private String writer;
	private int count;
	private String category;
	private int pNo;
	private char adopt;
	private String status;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Board(int boardNo, String title, String password, String content, Date enrollDate, Date modifyDate,
			String writer, int count, String category, int pNo, char adopt, String status) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.password = password;
		this.content = content;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.writer = writer;
		this.count = count;
		this.category = category;
		this.pNo = pNo;
		this.adopt = adopt;
		this.status = status;
	}



	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public char getAdopt() {
		return adopt;
	}

	public void setAdopt(char adopt) {
		this.adopt = adopt;
	}
	
	

	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", password=" + password + ", content=" + content
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", writer=" + writer + ", count="
				+ count + ", category=" + category + ", pNo=" + pNo + ", adopt=" + adopt + ", status=" + status + "]";
	}



	
	
}
