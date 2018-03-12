package com.kh.pj.member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pj.member.model.service.MemberService;
import com.kh.pj.member.model.vo.Member;

/**
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet("/SearchPwdServlet.me")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member_Id");
		String name = request.getParameter("member_name");
		String email = request.getParameter("email");
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberName(name);
		m.setEmail(email);
		
		String userNo = new MemberService().searchingPwd(m);
		
		String page = "";
		if(userNo  != null){
			String Rpw[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
							"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
							"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
			
			String pass = "";
			
			System.out.println(Rpw.length);
			
			for (int i = 0; i < 6; i++) {
				pass += Rpw[(int)(Math.random() * 36)];
				System.out.println(pass);
			}
			
			String pass2 = getSha512(pass);
			
			System.out.println(pass2);
			
			int result = new MemberService().emailPwd(pass2, userNo);
			
			if(result > 0){
				new EmailSend().SendEmail(pass, email);
				
				page = "views/common/successPage.jsp";
				request.setAttribute("msg", "임시비밀번호가 가입시 입력한 이메일로 발송되었습니다.");
				
			}else{
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "이메일 전송 실패");
			}

		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "메롱 실패네");
		}
		

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		

	}
	
	private static String getSha512(String pwd){
		String encPwd = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			encPwd = Base64.getEncoder().encodeToString(md.digest());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return encPwd;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
