package com.kh.pj.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int delectMember(Member m) {
		Connection con = getConnection();

		int result = new MemberDao().delectMember(con, m);

		if (result > 0) {
			commit(con);
		} else {
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

		if (result > 0) {
			commit(con);
		} else {
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

		close(con);

		return userId;
	}

	public String searchingPwd(Member m) {
		Connection con = getConnection();

		String userPwd = new MemberDao().searchingPwd(con, m);

		close(con);

		return userPwd;

	}

	public int emailPwd(String pass2, String userNo) {
		Connection con = getConnection();

		int result = new MemberDao().emailPwd(con, pass2, userNo);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public ArrayList<Member> MemberAllSelect() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<Member> list = new MemberDao().MemberAllSelect(con);
		close(con);
		return list;
	}

	public ArrayList<Member> MemberSearch(String searchval, String searchcon) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<Member>list = new MemberDao().MemberSearch(con,searchval,searchcon);
		close(con);
		return list;
	}

	public int memberWithdraw(String memberID) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result=new MemberDao().memberWithdraw(con,memberID);
		if(result>0)
		{
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int memberReturn(String memberID) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result=new MemberDao().memberReturn(con,memberID);
		if(result>0)
		{
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

}
