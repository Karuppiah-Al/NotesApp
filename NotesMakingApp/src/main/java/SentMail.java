import java.util.*;


import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import JavaBean.User;
public class SentMail {
	public String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		return String.format("%06d", number);
	}
	public boolean SendMail(User user) {
		String mail = user.getMail();
		boolean flag = false;
		String frommail = "samplemailforbootcamp@gmail.com";
		String password = "@bootteam123";
		try {
			Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.mail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        Authenticator a =new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(frommail, password);
	            }
	        };
	        Session session = Session.getInstance(pr, a);
	        Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(frommail));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(mail));
            message.setSubject("OTP");
            message.setText("this the OTP(One Time Password) Veriication Code for Inventory Registration");
            Transport.send(message);
            System.out.println("Done");
            flag = true;
		}
		catch(Exception e) {
			System.out.println(e+"in sending mail");
		}
		return flag;
	}
}
