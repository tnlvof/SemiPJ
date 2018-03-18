package com.kh.pj.member.controller;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailCheck {
	public void emailCheck(String email, String code){
		
		Properties p = new Properties(); // 정보를 담을 객체
		
		p.put("mail.smtp.host","smtp.naver.com");
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		/*p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");*/
		
		
		try{
			Authenticator auth = new SMTPAuthenticatior();
			Session session = Session.getInstance(p, auth);
			
			session.setDebug(true);
			MimeMessage msg = new MimeMessage(session); // 메일의 내용을 담을 객체 
			
			msg.setSubject("앞날이 창창 이메일 인증번호"); //  제목
			
			//StringBuffer buffer = new StringBuffer();
			
			Address fromAddr = new InternetAddress("admin<wlsdus1103@naver.com>");
			msg.setFrom(fromAddr); 
			
			Address toAddr = new InternetAddress(email);
			System.out.println("이메일체크" + toAddr);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
			
			msg.setContent("인증번호 : " + code, "text/html;charset=UTF-8"); // 내용
			Transport.send(msg); // 전송  
			
		} catch(Exception e){
			e.printStackTrace();
			return;
		}
	}
}
