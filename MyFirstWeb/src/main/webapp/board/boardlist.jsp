<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
      
       ${boardList }
       <hr/>
       <!-- 출력방법 : 인덱싱이나 c:forEach를 이용해서 하나하나 꺼내준 다음
       .변수명 을 적으면 출력됩니다. -->
      
        0번째 요소 : ${boardList[0] }<br/>
        1번째 요소 : ${boardList[1] }<br/>
        2번째 요소 : ${boardList[2] }<br/>
        <hr/>
        
       전체 데이터 : ${boardList[0] }<br/>
       글번호 : ${boardList[0].board_num }<br/>
       글제목 : ${boardList[0].title }<br/>
       
      
       <hr/>
        <a href="http://localhost:8181/MyFirstWeb/board/boardform.jsp">글쓰기</a>
        <table class="table table-hover" border="1">
         <tr>
	         <th>글번호</th>
	         <th>글제목</th>
	         <th>글쓴이</th>
	         <th>쓴날짜</th>
	         <th>최종수정날짜</th>
	         <th>조회수</th>
         </tr>
            <c:forEach var="board" items="${boardList }"> 
	         <tr>
	             <td>${board.board_num }</td>
	             <td><a href="http://localhost:8181/MyFirstWeb/boarddetail?board_num=${board.board_num } ">${board.title }</td>
	             <td>${board.writer }</td>
	             <td>${board.bdate }</td>
	             <td>${board.mdate }</td>
	             <td>${board.hit }</td>
	          </tr>    
            </c:forEach>
         </table>
      
</body>
</html>