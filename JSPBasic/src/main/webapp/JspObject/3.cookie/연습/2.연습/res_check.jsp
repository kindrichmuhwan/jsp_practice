<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <%
      String strAge = request.getParameter("age");
      int age = Integer.parseInt(strAge);
      
      //response.sendRedirect("https:www.naver.com");
      
      if(age >= 20 ){
    	  response.sendRedirect("res_adult.jsp");
      }else if (age < 20){
    	  response.sendRedirect("res_child.jsp");
      }
      
      %>
</body>
</html>