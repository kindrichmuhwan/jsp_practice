
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 아까 발생했던 rs.close() 실행 문제로 인해
    // DB에 있는 자료를 꺼냈을때, 곧바로 jsva 데이터로 받아오는 작업을 수행한 다음
    // rs.close()를 하면 문제가 없습니다.
    // 따라서 SELECT 구문의 결과(SQL데이터)를 담을 클래스가 필요하고,
    // 이를 VO(Value Object)라고 부릅니다.
    // VO는 클래스이기 떄문에 src/main/java에 클래스를 선언 및 정의합니다.
    // userVO.class 를 만들어 보겠습니다.
    
 /*   
    // 1. 연결 변수 관리
    
    String dbType = "com.mysql.cj.jdbc.Driver";
    String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
    String dbId = "root";
    String dbPw = "mysql";
   
    ResultSet rs = null; 
    Connection con=null;
    PreparedStatement pstmt= null;
  
    // ArrayList<UserVO> 자료형을 이용해 한 줄 한 줄 단위로 여러 row를 저장합니다.
    List<UserVO> userList = new ArrayList<>();
   try{
	   // 2. 연결
    	Class.forName(dbType);
    	 con = DriverManager.getConnection(dbUrl,dbId, dbPw);
    	//3. SELECT * FROM userinfo
    	 String sql = "SELECT * FROM userinfo";
    	 
    	 pstmt = con.prepareStatement(sql);
    	 rs = pstmt.executeQuery(); 
    	
    	 // 테이블에 저장된 데이터를 자바로 옮기기 위해서 UserVO를 선언했습니다.
    	 // UserVO 하나 생성으로 몇 row 
    	 while(rs.next()){
    		 // 1. ResultSet에서 데이터 가져오기
    		 String uName = rs.getString("uname");
    		 String uId = rs.getString("uid");
    		 String uPw = rs.getString("upw");
    		 String uEmail = rs.getString("uemail");
    		 
    		 UserVO userDate = new UserVO(uName, uId, uPw, uEmail);
    		 userList.add(userDate);
    	 }
    	 System.out.println(userList +"<br/>");
    	// out.println(userList + "<br/>");
    	 
      }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	// 이 영역에서 바로 .close()를 쓰고도 데이터를 body태그에서 쓰려면
    	// .close()이전에 DB에 있던 데이터를 모조리 자바로 옮겨야 합니다.
    		con.close();
    	    pstmt.close();
    	    rs.close();
    }
    
    */
   // 모든 접속정보는 UserDAO 클래스 내에 있습니다.
    // 따라서 UserDAO를 생성하는 것으로 접속 정보 설정이 끝납니다.
    UserDAO dao =UserDAO.getInstance();
    // dao 내부에 userunfo 테이블 전체의 데이터를 가져오는
    // getALLUserList()를 호출하는 것으로 필요 데이터 적재가 끝납니다.
    List<UserVO> userList = dao.getAllUserList();// DB내 전체 데이터를 우측에 배달받아 좌변에 저장
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <!-- 향샹된 for문을 이용해서 userList 내부의 데이터를 
           Table형태로 user_list1과 동일한 양식으로 화면에 출력해주세요. -->
           
      <table border="1px">
           <thead>
             <tr> 
                <th>유저이름</th>
                <th>유저아이디</th>
                <th>유저비밀번호</th>
                <th>유저이메일</th>
             </tr>
           </thead> 
           <tbody>
              <%for( UserVO user: userList){%>
                 <tr>
                    <td><%=user.getuName()%></td>
                    <td><%=user.getuId()%></td>
                    <td><%=user.getuPw()%></td>
                    <td><%=user.getuEmail() %></td>
                 </tr>
              <% }%>
           </tbody>
      </table>
</body>
</html> 	
    	
    	
 