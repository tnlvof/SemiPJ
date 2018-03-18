package com.kh.pj.analyse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.pj.analyse.model.service.AnalyseService;
import com.kh.pj.map.model.service.AlleyService;

/**
 * Servlet implementation class InsertReport
 */
@WebServlet("/insertReport.an")
public class InsertReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = request.getParameter("address");
		String areaCode = request.getParameter("areaCode");
		String catagoryCode = request.getParameter("catagoryCode");
		String memberNo = request.getParameter("memberNo");
		
		int result = new AnalyseService().insertCode(address, areaCode, catagoryCode, Integer.parseInt(memberNo));
		
		System.out.println("insertcode : "+address+ " " + areaCode + " " + catagoryCode);
		
		if(result>0){
			HashMap<String, ArrayList<HashMap>> allTable = new AnalyseService().doAnalyse(areaCode);
			if(allTable!=null){
				/*java.util.Iterator iter = allTable.keySet().iterator();
				while(iter.hasNext()){
					String key = (String) iter.next();
					System.out.println("key : " + key + " value : " + allTable.get(key));
				}*/
				HttpSession session = request.getSession();
				session.setAttribute("allTable", allTable);
				session.setAttribute("catagoryCode", catagoryCode);
				request.getRequestDispatcher("/views/analyseResult/anaResult0.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("msg", "분석이력 저장 실패");
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
