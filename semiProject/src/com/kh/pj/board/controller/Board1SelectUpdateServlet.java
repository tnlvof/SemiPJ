package com.kh.pj.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.board.model.service.BoardService;
import com.kh.pj.board.model.vo.Attachment;
import com.kh.pj.board.model.vo.Board;

/**
 * Servlet implementation class SelectUpdateBoardServlet
 */
@WebServlet("/selectUpdate.b1")
public class Board1SelectUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board1SelectUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		String boardCategory = "1";
		
		HashMap<String, Object> hmap = new BoardService().selectOneBoard1(num,boardCategory);
		
		System.out.println(hmap);
		
		Board b= (Board)hmap.get("board");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>)hmap.get("attachment");
		
		String page = "";
		if(hmap != null) {
			page = "views/community/board1/board1_update.jsp";
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사진 게시판 상세조회 실패!");
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
