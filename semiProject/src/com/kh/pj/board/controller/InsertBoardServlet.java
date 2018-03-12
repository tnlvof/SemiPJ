package com.kh.pj.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.board.model.service.BoardService;
import com.kh.pj.board.model.vo.Board;
import com.kh.pj.member.model.vo.Member;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/InsertBoardServlet.bo")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*	String bCategory = request.getParameter("bCategory");
		String bTitle = request.getParameter("bTitle");
		String bText = request.getParameter("bText");
		
		String writer = String.valueOf((((Member)(request.getSession().getAttribute("loginUser"))).getMemberNo()));
		
		Board b = new Board();
		b.setbCategory(bCategory);
		b.setbTitle(bTitle);
		b.setbText(bText);
		b.setbWriter(writer);
		
		int result = new BoardService().insertBoard(b);
		
		 String page="";
		 if(result > 0){
			 response.sendRedirect(request.getContextPath() + "/selectList.bo");
		 } else{
			 request.setAttribute("msg", "게시판 작성 실패!");
			 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		 }*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
