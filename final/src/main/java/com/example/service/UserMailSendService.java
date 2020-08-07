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
			String htmlStr = "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTU0/MDAxNTk2Njk2MTQyMDE0.7aFt6OXsRYbZ8IqbgxQFII2IONscXwN6nbFVt9Kj3yMg.lo2WMu8KR38eauxpeFa-5CVuPNJiwbYcx1IQMvqyDhYg.PNG.d0_heeee/email_image1.png?type=w773'><br>" 
					+ "<div style='margin-left:52px; font-size:30px; display:inline'>" + u_id + "</div><img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTg3/MDAxNTk2Njk2NDcxMjQ1.I4RWX-GtA40mfQt2jU3hWfCF2Eka12HeouGA6oB2nuYg.9kc-Bvhbs-rM-nyo7L5M5U-xlCOQ8mQ-iCkYQT0HdXwg.PNG.d0_heeee/email_image2.png?type=w773'>"
					+ "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTE3/MDAxNTk2NjkyMDY2MTQ4.oqtnnuYPgFXNfgPQrIl-lXVcdLLtpDc01YehW_j8wY8g.FL6iVWkFwVmIhiBa605zD6Buis_790OFebyFWwCoHNkg.PNG.d0_heeee/email_image3.png?type=w773'>"
					+ "<br><br><br><br><a style='color:white; text-decoration:none; display:inline-block; background:#0f4c81; padding:10px 40px 10px 40px; margin-left:280px; border-radius:3px 3px 3px 3px;' href='http://localhost:8088" + request.getContextPath() + "/user/key_alter?user_id="+ u_id +"&user_key="+key+"'>인증하기</a>";
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
			String htmlStr = "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTU0/MDAxNTk2Njk2MTQyMDE0.7aFt6OXsRYbZ8IqbgxQFII2IONscXwN6nbFVt9Kj3yMg.lo2WMu8KR38eauxpeFa-5CVuPNJiwbYcx1IQMvqyDhYg.PNG.d0_heeee/email_image1.png?type=w773'><br>" 
					+ "<div style='margin-left:52px; font-size:30px; display:inline'>" + c_id + "</div><img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTg3/MDAxNTk2Njk2NDcxMjQ1.I4RWX-GtA40mfQt2jU3hWfCF2Eka12HeouGA6oB2nuYg.9kc-Bvhbs-rM-nyo7L5M5U-xlCOQ8mQ-iCkYQT0HdXwg.PNG.d0_heeee/email_image2.png?type=w773'>"
					+ "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTE3/MDAxNTk2NjkyMDY2MTQ4.oqtnnuYPgFXNfgPQrIl-lXVcdLLtpDc01YehW_j8wY8g.FL6iVWkFwVmIhiBa605zD6Buis_790OFebyFWwCoHNkg.PNG.d0_heeee/email_image3.png?type=w773'>"
					+ "<br><br><br><br><a style='color:white; text-decoration:none; display:inline-block; background:#0f4c81; padding:10px 40px 10px 40px; margin-left:280px; border-radius:3px 3px 3px 3px;' href='http://localhost:8088" + request.getContextPath() + "/user/key_alterCompany?user_id="+ c_id +"&user_key="+key+"'>인증하기</a></p>";
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
			String htmlStr = "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTU0/MDAxNTk2Njk2MTQyMDE0.7aFt6OXsRYbZ8IqbgxQFII2IONscXwN6nbFVt9Kj3yMg.lo2WMu8KR38eauxpeFa-5CVuPNJiwbYcx1IQMvqyDhYg.PNG.d0_heeee/email_image1.png?type=w773'><br>" 
					+ "<div style='margin-left:52px; font-size:30px; display:inline'>" + email + "</div><img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTg3/MDAxNTk2Njk2NDcxMjQ1.I4RWX-GtA40mfQt2jU3hWfCF2Eka12HeouGA6oB2nuYg.9kc-Bvhbs-rM-nyo7L5M5U-xlCOQ8mQ-iCkYQT0HdXwg.PNG.d0_heeee/email_image2.png?type=w773'>"
					+ "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfOCAg/MDAxNTk2Njk4MzI5NTU1.vxfmzWW3OuZXzAMfeHwO1VoA7tjIP21kPznVfcBO_pMg.EGgFTk1shx08rXdBhlNEJN2dBWmV1EVY3caBweYROpIg.PNG.d0_heeee/email_image4.png?type=w773'><div style='display:inline; font-size:30px; margin:0px 10px 0px 10px;'>"+key+"</div><img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMjkw/MDAxNTk2Njk4MjAzNjM3.I-BQlnqbffvLLaawYq2noB3Pduq27HjRXKrK0BWtZYEg.Svszzl3ySYr2Y_fL3oWJD-K_4JEIaA4nGuLi5v-psN4g.PNG.d0_heeee/email_image5.png?type=w773'>";
			try {
				mail.setSubject("[IDFind] MS :p 투어썸 ID/PASS 인증메일입니다", "utf-8");
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
			String htmlStr = "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTU0/MDAxNTk2Njk2MTQyMDE0.7aFt6OXsRYbZ8IqbgxQFII2IONscXwN6nbFVt9Kj3yMg.lo2WMu8KR38eauxpeFa-5CVuPNJiwbYcx1IQMvqyDhYg.PNG.d0_heeee/email_image1.png?type=w773'><br>" 
					+ "<div style='margin-left:52px; font-size:30px; display:inline'>" + email + "</div><img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMTg3/MDAxNTk2Njk2NDcxMjQ1.I4RWX-GtA40mfQt2jU3hWfCF2Eka12HeouGA6oB2nuYg.9kc-Bvhbs-rM-nyo7L5M5U-xlCOQ8mQ-iCkYQT0HdXwg.PNG.d0_heeee/email_image2.png?type=w773'>"
					+ "<img src='https://postfiles.pstatic.net/MjAyMDA4MDZfOCAg/MDAxNTk2Njk4MzI5NTU1.vxfmzWW3OuZXzAMfeHwO1VoA7tjIP21kPznVfcBO_pMg.EGgFTk1shx08rXdBhlNEJN2dBWmV1EVY3caBweYROpIg.PNG.d0_heeee/email_image4.png?type=w773'><div style='display:inline; font-size:30px; margin:0px 10px 0px 10px;'>"+key+"</div><img src='https://postfiles.pstatic.net/MjAyMDA4MDZfMjkw/MDAxNTk2Njk4MjAzNjM3.I-BQlnqbffvLLaawYq2noB3Pduq27HjRXKrK0BWtZYEg.Svszzl3ySYr2Y_fL3oWJD-K_4JEIaA4nGuLi5v-psN4g.PNG.d0_heeee/email_image5.png?type=w773'>";
			try {
				mail.setSubject("[IDFind] MS :p 투어썸 ID/PASS 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return key;
	}
		
}
