package com.kh.pj.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.board.model.service.BoardService;
import com.kh.pj.board.model.vo.Board;

/**
 * Servlet implementation class SelectUpdateBoardServlet
 */
@WebServlet("/selectUpdate.b1")
public class SelectUpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectUpdateBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String num = request.getParameter("num");

		Board b = new BoardService().selectOneBoard1(num);
		
		String page= "";
		if(b != null) {
			page = "views/notice/noticeUpdate.jsp";
			request.setAttribute("n", b);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정용 상세보기 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
