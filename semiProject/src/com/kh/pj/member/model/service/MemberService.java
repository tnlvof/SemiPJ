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
		return 0;
	}

}
