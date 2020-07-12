/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package emailGenerator;
import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.http.*;
import javax.servlet.*;
/**
 *
 * @author Harshit
 */
public class Email 
{
    public String sendEmail(String receiver,String sub,String msg)
    {
        String result;
        // Recipient's email ID needs to be mentioned.
        String to = receiver;
        // Sender's email ID needs to be mentioned
        final String from = "mail.mysite@gmail.com";
        final String pass="my_password";
        // Assuming you are sending email from localhost
        String host = "smtp.gmail.com";
        // Get system properties object
        Properties props = new Properties();
        // Defining properties
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", host);
        props.put("mail.user", from);
        props.put("mail.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Authorized the Session object.
        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });
        try {
           // Create a default MimeMessage object.
           MimeMessage message = new MimeMessage(mailSession);
           // Set From: header field of the header.
           message.setFrom(new InternetAddress(from));
           // Set To: header field of the header.
           message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
           // Set Subject: header field
           message.setSubject(sub);
           // Now set the actual message
           message.setText(msg);
           // Send message
           Transport.send(message);
           result = "Sent message successfully....";
           return "1";
        } catch (MessagingException mex) 
        {
           mex.printStackTrace();
           result = "Error: unable to send message....";
           return "0";
        }
    }
}
   

