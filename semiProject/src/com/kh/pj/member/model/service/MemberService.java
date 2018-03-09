package com.kh.pj.member.model.service;

import java.sql.Connection;

import com.kh.pj.member.model.dao.MemberDao;
import com.kh.pj.member.model.vo.Member;

import static com.kh.pj.common.JDBCTemplet.*;
public class MemberService {

	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, m);
		
		close(con);
		
		return result;
	}

	public Member loginCheck(String userId, String userPwd) {		
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, userId, userPwd);
		
		close(con);
		
		return loginUser;
	}

	public int changeInfo(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMember(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int delectMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().delectMember(con, m);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int idCheck(String memberId) {
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, memberId);
		
		close(con);
		
		return result;
	}

	public int changePassword(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().changePassword(con, m);
		
		System.out.println("MemberService changePassword : " + result);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int checkPassword(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().checkPassword(con, m);
		
		close(con);
		
		return result;
	}

	public String searchingId(Member m) {
		Connection con = getConnection();
		
		String userId = new MemberDao().searchingId(con, m);
		
		return userId;
	}

	public int searchingPwd(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().searchingPwd(con, m);
		
		if(result>0) commit(con);
		else rollback(con);
		
		return result;

	}
	

}
