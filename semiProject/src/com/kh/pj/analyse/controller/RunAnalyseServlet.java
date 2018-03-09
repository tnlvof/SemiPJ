package com.kh.pj.analyse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.Iterator;

import org.json.simple.JSONObject;

import com.kh.pj.analyse.model.service.AnalyseService;

/**
 * Servlet implementation class RunAnalyseServlet
 */
@WebServlet("/runAnalyse.an")
public class RunAnalyseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RunAnalyseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String areaCode = request.getParameter("areaCode");
		String catagoryCode = request.getParameter("catagoryCode");
		
		//ArrayList<ArrayList> allList = new DoAnalyse().doAnalyse(code);
		
		HashMap<String, ArrayList<HashMap>> allTable = new AnalyseService().doAnalyse(areaCode, catagoryCode);
		
		if(allTable!=null){
			java.util.Iterator iter = allTable.keySet().iterator();
			while(iter.hasNext()){
				String key = (String) iter.next();
				System.out.println("key : " + key + " value : " + allTable.get(key));
			}
			HttpSession session = request.getSession();
			session.setAttribute("allTable", allTable);
			request.getRequestDispatcher("/views/analyseResult/anaResult0.jsp").forward(request, response);
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
