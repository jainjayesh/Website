<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="com.sun.mail.smtp.SMTPTransport" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String addressedTo = request.getParameter("email");
String subject = "Enquiry";//request.getParameter("subject");
String content = request.getParameter("message"); 

String fromAddress = request.getParameter("email");//Your Email Address//
        String recipients = "jain.jayesh@tirnav.in";
        String contentType = "text/plain";
        String smtpHost = "mail.tirnav.in";//Your Outgoing Mailbox//
        int smtpPort = 587;
        String username = "jain.jayesh@tirnav.in";//Your Mailbox Username//
        String password = "J#260190";//Your Mailbox Password//
        try
        {
            Properties props = System.getProperties();
            //props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.trust", "mail.tirnav.in");
            Session sess = Session.getDefaultInstance(props);
 
            MimeMessage message = new MimeMessage(sess);
 
            message.setFrom(new InternetAddress(fromAddress));
            message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(recipients, false));
 
            message.setSubject(subject);
            message.setContent(content, contentType);
            message.setSentDate(new Date());
 
            Transport transport = sess.getTransport("smtp");
            transport.connect(smtpHost, smtpPort, username, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
 
        } catch (MessagingException messagingException)
        {
            System.out.print(messagingException);
 
        } catch (Exception e)
        {
            System.out.print(e);
        }

   %>
</body>
</html>