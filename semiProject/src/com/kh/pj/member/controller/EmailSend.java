package com.kh.pj.member.controller;

import java.util.Map;
import java.util.List;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import com.kh.pj.member.controller.SMTPAuthenticatior;
import javax.mail.Authenticator;
import java.util.Properties;

public class EmailSend {
	public void SendEmail(String pass, String email){
		
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
			
			msg.setSubject("앞날이 창창 임시 비밀번호"); //  제목
			
			//StringBuffer buffer = new StringBuffer();
			
			Address fromAddr = new InternetAddress("admin<wlsdus1103@naver.com>");
			msg.setFrom(fromAddr); 
			
			Address toAddr = new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
			
			msg.setContent("임시비밀번호 : " + pass, "text/html;charset=UTF-8"); // 내용
			Transport.send(msg); // 전송  
			
		} catch(Exception e){
			e.printStackTrace();
			return;
		}
	}
}
