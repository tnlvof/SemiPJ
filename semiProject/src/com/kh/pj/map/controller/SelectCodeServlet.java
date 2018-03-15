package com.kh.pj.map.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.pj.map.model.service.AlleyService;
import com.kh.pj.map.model.vo.Alley;

/**
 * Servlet implementation class SelectCodeServlet
 */
@WebServlet("/select.cd")
public class SelectCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectCodeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String address = request.getParameter("address");
		int code = new AlleyService().selectAlleyCode(address);
		String shopcode = request.getParameter("shopcode");

		System.out.println("address:" + address + " code:" + code + " shopcode:" + shopcode);

		ArrayList<String> list = new ArrayList<>();
		String[] arr = new String[3];
		arr[0] = address;
		arr[1] = String.valueOf(code);
		arr[2] = shopcode;
		
		for(int i =0; i<arr.length;i++)
		{
			
			list.add(arr[i]);
		}
		System.out.println(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
