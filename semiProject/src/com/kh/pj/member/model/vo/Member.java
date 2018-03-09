package com.kh.pj.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String birth;
	private String phone;
	private String email;
	private String address;
	private String nickName;
	private String memberCategory;
	private Date enrollDate;
	private String company;
	private String companyCategory;
	private String companyNo;
	private String companyAddress;
	private String companyPhone;
	private String status;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Member(int memberNo, String memberId, String memberPwd, String memberName, String birth, String phone,
			String email, String address, String nickName, String memberCategory, Date enrollDate, String company,
			String companyCategory, String companyNo, String companyAddress, String companyPhone, String status) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.nickName = nickName;
		this.memberCategory = memberCategory;
		this.enrollDate = enrollDate;
		this.company = company;
		this.companyCategory = companyCategory;
		this.companyNo = companyNo;
		this.companyAddress = companyAddress;
		this.companyPhone = companyPhone;
		this.status = status;
	}



	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMemberCategory() {
		return memberCategory;
	}

	public void setMemberCategory(String memberCategory) {
		this.memberCategory = memberCategory;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompanyCategory() {
		return companyCategory;
	}

	public void setCompanyCategory(String companyCategory) {
		this.companyCategory = companyCategory;
	}

	public String getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", birth=" + birth + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", nickName=" + nickName + ", memberCategory=" + memberCategory + ", enrollDate=" + enrollDate
				+ ", company=" + company + ", companyCategory=" + companyCategory + ", companyNo=" + companyNo
				+ ", companyAddress=" + companyAddress + ", companyPhone=" + companyPhone + ", status=" + status + "]";
	}


	public void setInterest(String interest) {
		// TODO Auto-generated method stub
		
	}
	
	
}
