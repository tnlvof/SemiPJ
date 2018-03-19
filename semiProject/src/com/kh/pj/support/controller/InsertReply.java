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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
