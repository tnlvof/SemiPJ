package com.kh.pj.support.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.pj.member.model.vo.Member;
import com.kh.pj.support.model.service.SupportService;
import com.kh.pj.support.model.vo.Support;

/**
 * Servlet implementation class InsertQnaReply
 */
@WebServlet("/insertReply.sp")
public class InsertReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text = request.getParameter("text");
		
		String writer = String.valueOf((((Member)(request.getSession().getAttribute("loginUser"))).getMemberNo()));
		String boardCategory = "7";
		
		System.out.println(text);
		System.out.println(writer);
		
		Support s = new Support();
		s.setbText(text);
		s.setbWriter(writer);
		
		int result = new SupportService().insertReply(s, boardCategory);
		
		String page="";
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectQna.sp");
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
