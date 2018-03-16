package com.kh.pj.support.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.board.model.vo.PageInfo;
import com.kh.pj.support.model.service.SupportService;
import com.kh.pj.support.model.vo.Support;

/**
 * Servlet implementation class UpdateFaqServlet
 */
@WebServlet("/updateFaq.sp")
public class UpdateFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFaqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		SupportService ss = new SupportService();
		String boardCategory = "8";
		int listCount = ss.getListCount(boardCategory);
		
		System.out.println("listCount : " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		System.out.println(title);
		System.out.println(text);
		System.out.println(bno);
		
		Support s = new Support();
		s.setbTitle(title);
		s.setbText(text);
		s.setbNo(bno);
		
		int result = new SupportService().updateNotice(s, boardCategory);
		
		String page = "";
		if(result > 0){
			page = "views/support/faq/faqDetail.jsp";
			request.setAttribute("s", new SupportService().selectOne(bno, boardCategory));
			request.setAttribute("pi", pi);
		} else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 수정 실패!");
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
