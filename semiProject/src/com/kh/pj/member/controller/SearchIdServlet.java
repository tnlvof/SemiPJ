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
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/SearchIdServlet.me")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("member_name");
		String birth = request.getParameter("birth");
		
		Member m = new Member();
		m.setMemberName(name);
		m.setBirth(birth);
		
		String userId = new MemberService().searchingId(m);
		
		String page = "";
		if(userId  != null){
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "당신의 아이디는 : " + userId);

		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "메롱 실패네");
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
