package com.kh.pj.analyse.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.analyse.model.service.AnalyseService;

/**
 * Servlet implementation class SelectReportServlet
 */
@WebServlet("/selectReport.an")
public class SelectReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNo = request.getParameter("memberNo");
		
		ArrayList<HashMap<String, String>> list = new AnalyseService().selectReport(memberNo);
		if(list!=null){
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/common/myPage.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "분석이력 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
