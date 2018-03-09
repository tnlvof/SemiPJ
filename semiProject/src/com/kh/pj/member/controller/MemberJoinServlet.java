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
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet({ "/InsertMemberServlet", "/insertMember.me" })
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터에서 값 꺼내기
		
		//member 객체 생성
		Member m = new Member();
		
		//setter로 값 넣기
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberPwd(request.getParameter("memberPwd"));
		m.setMemberName(request.getParameter("memberName"));
		m.setNickName(request.getParameter("nickName"));
		m.setBirth(request.getParameter("birthday"));
		m.setPhone(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));
		m.setEmail(request.getParameter("email"));
		m.setAddress(request.getParameter("address1")+", "+request.getParameter("address2"));
		
		System.out.println(m);
		/*String[] interestArr = request.getParameterValues("interest");
		String interest = "";
		for (int i = 0; i < interestArr.length; i++) {
			if(i==0){
				interest += interestArr[i];
			}else{
				interest += ", " + interestArr[i];
			}
		}
		m.setInterest(interest);*/
		
		//서비스로 전달
		int result = new MemberService().insertMember(m);
		
		//페이지 연결
		String page = "";
		if(result>0){
			page="views/common/successPage.jsp";
			request.setAttribute("msg", "회원 가입 성공");
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 가입 실패");
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