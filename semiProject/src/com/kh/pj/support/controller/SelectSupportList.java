package com.kh.pj.support.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.support.model.service.SupportService;
import com.kh.pj.support.model.vo.Support;

/**
 * Servlet implementation class SelectSupportList
 */
@WebServlet("/select.sp")
public class SelectSupportList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSupportList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Support> list = new SupportService().selectList();
		
		System.out.println("list : " + list);

		String page="";
		if(list != null){
			page = "views/support/notice/noticeList.jsp";
			request.setAttribute("list", list);
		} else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
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
