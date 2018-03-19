package com.kh.pj.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.pj.member.model.service.MemberService;
import com.kh.pj.member.model.vo.Member;

/**
 * Servlet implementation class MemberSearchAllServlet
 */
@WebServlet("/msearch.al")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD:semiProject/src/com/kh/pj/support/controller/InsertReply.java
		String writer = request.getParameter("writer");
		int bid = Integer.parseInt(request.getParameter("bid"));
		String content = request.getParameter("content");
		
		System.out.println(writer);
		System.out.println(bid);
		System.out.println(content);
		
		Support s = new Support();
		s.setpNo(bid);
		s.setbWriter(writer);
		s.setbText(content);
		
		ArrayList<Support> replyList = new SupportService().insertReply(s);
		
		response.setContentType("application/json");
		new Gson().toJson(replyList, response.getWriter());
=======
		// TODO Auto-generated method stub
		String searchval=request.getParameter("searchval");
		String searchcon=request.getParameter("searchcon");
		System.out.println(searchval+searchcon);
		System.out.println("servlet init");
		ArrayList<Member>list = new MemberService().MemberSearch(searchval,searchcon);
		System.out.println(list+"servlet");
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
		
>>>>>>> master:semiProject/src/com/kh/pj/member/controller/MemberSearchServlet.java
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
