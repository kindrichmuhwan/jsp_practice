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
        String id = request.getParameter("id"); 
        String pw = request.getParameter("pw"); 
        String name = request.getParameter("name");
        String age = request.getParameter("age");
    
       
    %>
    
    <%if(id.equals("abcd")){ %>
       <b>중복된 아이디로 가입할 수 없습니다!!</b>
   <% }else{%> 
    <b><%=name  %>님 회원가입을 축하합니다.</b>
    
    <%} %>
</body>
</html>