package com.kh.pj.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.pj.board.model.service.BoardService;
import com.kh.pj.board.model.vo.Board;

/**
 * Servlet implementation class Board1InsertReply
 */
@WebServlet("/insertReply.b1")
public class Board1InsertReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board1InsertReply() {
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
		
		Board b = new Board();
		b.setpNo(bid);
		b.setbWriter(writer);
		b.setbText(content);
		
		ArrayList<Board> replyList = new BoardService().insertReply(b);
		
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
