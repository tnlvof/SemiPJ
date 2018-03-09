package com.kh.pj.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.board.model.service.BoardService;
import com.kh.pj.board.model.vo.Board;

/**
 * Servlet implementation class Board1InsertServlet
 */
@WebServlet("/insert.b1")
public class Board1InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board1InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(title);
		System.out.println(content);
		
		Board b = new Board();
		
		b.setTitle(title);
		b.setContent(content);
		
		int result = new BoardService().insertBoard(b);
		
		String page = "";
		if(result >0) {
		}else {
			request.setAttribute("msg", "게시판 작성 실패");
			request.getRequestDispatcher(page);
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
