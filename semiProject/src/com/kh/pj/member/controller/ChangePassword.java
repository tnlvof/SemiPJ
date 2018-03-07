package com.kh.pj.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.member.model.service.MemberService;
import com.kh.pj.member.model.vo.Member;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changePassword.me")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String MemberPwd = request.getParameter("memberPwd");
		
		Member m = new Member();
		m.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		m.setMemberPwd(request.getParameter("memberPwd"));
		
		int result = new MemberService().checkPassword(m);
		
		String page = "";
		if(result > 0){
			m.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			m.setMemberPwd(request.getParameter("changeMemberPwd"));
			System.out.println("Servlet : " + m);
			int result2 = new MemberService().changePassword(m);
			if(result2 > 0){
				page = "views/common/successPage.jsp";
			}else{
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "비밀번호 수정 실패!");
			}
			//request.setAttribute("n", new NoticeService().selectOne(String.valueOf(nno)));
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다!");
			System.out.println("Servlet : " + m);
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
