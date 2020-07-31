package com.example.service;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.example.mapper.UserMapper;

@Service
public class UserMailSendService{

	@Resource(name="mailSender")
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserMapper userDao;

	//이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}

		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}

		//유저 회원가입 발송 이메일(인증키 발송)
		public void mailSendWithUserKey(String u_email, String u_id, HttpServletRequest request) {
			
			String key = getKey(false, 20);
			userDao = sqlSession.getMapper(UserMapper.class);

			System.out.println(u_email+key);
			userDao.GetKey(u_id, key); 
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 투어썸입니다!</h2><br><br>" 
					+ "<h3>" + u_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8088" + request.getContextPath() + "/user/key_alter?user_id="+ u_id +"&user_key="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] MS :p 투어썸의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(u_email));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	}
		
		public int alter_userKey_service(String u_id, String key) {
			int resultCnt = 0;
			
			userDao = sqlSession.getMapper(UserMapper.class);
			resultCnt = userDao.alter_userKey(u_id, key);
			
			return resultCnt;
		}
		
		// 업체 회원가입 발송 이메일(인증키 발송)
		public void mailSendWithCompanyKey(String c_email, String c_id, HttpServletRequest request) {
			
			String key = getKey(false, 20);
			userDao = sqlSession.getMapper(UserMapper.class);

			userDao.GetKeyCompany(c_id, key);
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 투어썸입니다!</h2><br><br>" 
					+ "<h3>" + c_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8088" + request.getContextPath() + "/user/key_alterCompany?user_id="+ c_id +"&user_key="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] MS :p 투어썸의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(c_email));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	}
		
		public int alter_CompanyKey_service(String c_id, String key) {
			int resultCnt = 0;
			
			userDao = sqlSession.getMapper(UserMapper.class);
			resultCnt = userDao.alter_KeyCompany(c_id, key);
			
			return resultCnt;
		}
		
		//ID 찾기 인증번호 발송
		public String mailSendFindIdKey(String email, String name, String birthday, HttpServletRequest request) {
			
			String key = getKey(false, 5);
			userDao = sqlSession.getMapper(UserMapper.class);
			
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 투어썸입니다!</h2><br><br>" 
					+ "<h3>" + email + "님</h3>"  
					+ "ID/PASS 인증번호입니다."+key+" 인증번호를 입력해주십시오."
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[IDFind] MS :p 투어썸 ID 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return key;
	}
		
		//업체ID 찾기 인증번호 발송
		public String mailSendFindIdCompanyKey(String email, String name, String number, HttpServletRequest request) {
			
			String key = getKey(false, 5);
			userDao = sqlSession.getMapper(UserMapper.class);
			
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 투어썸입니다!</h2><br><br>" 
					+ "<h3>" + email + "님</h3>"  
					+ "ID/PASS 인증번호입니다."+key+" 인증번호를 입력해주십시오."
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[IDFind] MS :p 투어썸 ID 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return key;
	}
		
}
