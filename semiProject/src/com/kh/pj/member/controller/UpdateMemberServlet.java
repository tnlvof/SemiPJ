package com.kh.pj.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.member.model.service.MemberService;
import com.kh.pj.member.model.vo.Member;


/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/changeInfo.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String MemberId = request.getParameter("memberId");
		String MemberName = request.getParameter("memberName");
		String NickName = request.getParameter("nickName");
		String phone = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String email = request.getParameter("email");
		String address = request.getParameter("address1")+", "+request.getParameter("address2");
		
		Member m = new Member();
		m.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberName(request.getParameter("memberName"));
		m.setNickName(request.getParameter("nickName"));
		m.setBirth(request.getParameter("birthday"));
		m.setPhone(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));
		m.setEmail(request.getParameter("email"));
		m.setAddress(request.getParameter("address1")+", "+request.getParameter("address2"));
		System.out.println("Servlet : " + m);
		
		int result = new MemberService().changeInfo(m);
		
		String page = "";
		if(result > 0){
			page = "views/common/successPage.jsp";
			//request.setAttribute("n", new NoticeService().selectOne(String.valueOf(nno)));
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 수정 실패!");
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
