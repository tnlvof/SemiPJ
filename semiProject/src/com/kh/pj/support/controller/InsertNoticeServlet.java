package com.kh.pj.support.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.support.model.service.SupportService;
import com.kh.pj.support.model.vo.Support;
import com.kh.pj.member.model.vo.Member;

/**
 * Servlet implementation class insertSupportServlet
 */
@WebServlet("/insertNotice.sp")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String password = request.getParameter("password");
		
		String writer = String.valueOf((((Member)(request.getSession().getAttribute("loginUser"))).getMemberNo()));
		String boardCategory = "6";
		
		System.out.println(title);
		System.out.println(text);
		System.out.println(writer);
		System.out.println(password);
		
		Support s = new Support();
		s.setbTitle(title);
		s.setbText(text);
		s.setbWriter(writer);
		s.setbPassword(password);
		
		int result = new SupportService().insertNotice(s, boardCategory);
		
		String page="";
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/select.sp");
		} else{
			request.setAttribute("msg", "게시판 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
