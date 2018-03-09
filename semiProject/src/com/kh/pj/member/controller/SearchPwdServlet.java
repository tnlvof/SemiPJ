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
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet("/SearchPwdServlet.me")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("member_id");
		String birth = request.getParameter("birth");
		
		Member m = new Member();
		m.setMemberId(id);
		m.setBirth(birth);
		
		int result = new MemberService().searchingPwd(m);
		
		String page = "";
		if(result > 0){
			page = "views/login/foundIdPwd.jsp";
			request.setAttribute("msg", "비밀번호 찾기 성공" + m.getMemberPwd()); //
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호 찾기 실패 ㅜ_ㅜ");
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
