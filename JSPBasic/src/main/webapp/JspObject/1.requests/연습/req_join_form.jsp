<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <form action="req_join_result.jsp" method="post">
        아이디  : <input type="text" name="id"><br/>
        비밀번호 : <input type="password" name="pw"><br/>
         이름 :   <input type="text" name="name"><br/>
        나이 :    <input type="number" name="age"><br/>
         <input type="submit" value="회원가입">
         <input type="reset" value="초기화">
       
       </form>
</body>
</html>