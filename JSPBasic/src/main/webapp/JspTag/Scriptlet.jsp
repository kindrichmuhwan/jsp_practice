<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 스크릅트릿 내부에는 자바 코드를 작성할 수 있으며
    이 코드를 반영해 페이지가 구성됩니다. -->
    <% for(int i =0; i < 3; i++) { %>
       <h2>반복문 테스트1</h2>
       <p>
           반복문이 잘 됩니다.
       </p>    
    <% } %>
    
    <!-- 하단에 구구단 코드를 작성해주세요
    system.out.println() 이 괄호 내 구문을 콘솔에 찍히게 해줬다면
    out.println()은 html화면에 괄호 내 구문을 콘솔에 찍히게 해줍니다.
    <jsvascript의 document.write()와 같은 역할 -->
    <h2>구구단 2단</h2>
    <%
    for(int i = 1; i < 10; i++){
    	out.println("2 *" + i + "=" + (2*i) + "<br/>");
  		  }
    %> 
       <!-- 3단부터 출력 -->
    <%
	      for(int i = 3; i < 10; i++){
	           out.println("<h1>" + i + "단</h1>");
	    	  for(int j = 1; j <= 9; j++){
	    	   
	    	   out.println(i + "*" + j + "=" + (i*j) + "<br/>");
	       }
	            out.println("---------------------");
         	}
    %>
    
</body>
</html>