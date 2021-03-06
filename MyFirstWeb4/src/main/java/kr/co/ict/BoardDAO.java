package kr.co.ict;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	//DAO 코드 재활용하기
	// 
	
	//2. ~~~DAO 로 되어있는 부분을 전부 현재 DAO클래스명으로 변경
	// 예) UserDAO -> BoardDAO로 전환중이므로 UserDAO라고 적힌 부분을 전부 BoardDAO로 변경
	private DataSource ds = null;

	
	 private static BoardDAO dao = new BoardDAO();
	
	
	public BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
     // 필요로 하는 로직과 유사한 메서드를 복사해옵니다.
	 // 게시판 글 전체 목록 가져오기-> 회원 전체 목록 가져오기를 이용해 수정
     // 회원 전체 목록을 가져오는 getALLUserList를 수정해 getAllBoardList()를 생성해보겠습니다.
	
	 // UserVO는 userInfo테이블에 맞춰서 생성된 것이므로
	 // boardTbl에 맞춰서 처리하기 위해 UserVO를 사용하는 부분을 전부 BoardVO로 수정해줍니다.
	
	 // 3-2. 쿼리문을 boardinfo 테이블에서 데이터를 가져오도록 수정합니다.
	// 3-3 while문을 내부에서 BoardVO 세팅이 가능하도록 rs에서 데이터 가져오는 부분을 수정합니다.
	public List<BoardVO> getAllboardList(){

          Connection con =null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  
		  // try블럭 진입 전에 ArrayList 선언
		  List<BoardVO> boardList = new ArrayList<>();
    

		  try {
		  // Connection, PreparedStatement, ResultSet을 선언합니다.
			  con = ds.getConnection();

	  	//3. SELECT * FROM userinfo
	  	 String sql = "SELECT * FROM boardinfo ORDER BY board_num DESC";
	  	 
	  	 pstmt = con.prepareStatement(sql);
	  	
	  	 rs = pstmt.executeQuery(); 
		  
		  // BoardList ArrayList에 rs에 든 모든 자료를 저장해주세요.
	  	 
	  	 while(rs.next()){
			 
			 int board_num = rs.getInt("board_num");
			 String title = rs.getString("title");
			 String content = rs.getString("content");
			 String writer = rs.getString("writer");
			 Date bdate = rs.getDate("bdate");
			 Date mdate = rs.getDate("mdate");
			 int hit = rs.getInt("hit");
			 
			 // int board_num, String title, String content, String writer, Date bdate, Date mdate, int hit
			 // 해당 변수를 이용해  BoardVO를 생성해주시면 됩니다.
			 BoardVO BoardDate = new BoardVO(board_num, title, content, writer,bdate,mdate,hit);
			 boardList.add(BoardDate);
		 }
	            	
	  	 
		  }catch(Exception e) {
			  e.printStackTrace();
		  }finally {
		   
			  try {
		    	 
		    	 con.close();
			     pstmt.close();
			     rs.close();
			  } catch(SQLException se) {
				  se.printStackTrace();
			  }
			 
	  
		  }
		  return boardList;
	  }



//insertBoard 내부 쿼리문 실행시 필요한 3개 요소인 글제목, 본문, 글쓴이를 입력해야만 실행할수 있게 설계합니다.
	public void insertBoard(String title, String content, String writer) {
		// DB 연결구문을 작성해서 보내주세요.
		// try블럭 진입 전 Connection, PreparedStatement 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		
		 
		try {
			// Connection, PreparedStatement, ResultSet을 선언합니다.
			con = ds.getConnection();
			
			// INSERT의 경우 두 가지 유형이 있음
			
			// 전체 컬럼 요소 다 넣기 - INSERT INTO boardTbl VALUES (null, ?, ?, ?, now(), now(), 0)
			// 일부요소만 넣기 - INSERT INTO boardTbl(title, content, writer) VALUES (?, ?, ?)
			String sql = "INSERT INTO boardinfo(title, content, writer) VALUES (?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			// 실행 전 상단 쿼리문 ? 채워넣기
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			// 실행하기
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}	
	
	
	}

	// 글 한개가 피룡한 상황이므로 BoardVO 하나면 처리 가능
	// "SELECT * FROM boardinfo WHERE board_num=?"
	public BoardVO getBoardDetail(int board_num) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board= null;
		
		//BoardVO board = new ArrayList<>();
		
		try {
			con=ds.getConnection();
			
			String sql="SELECT *FROM boardinfo WHERE board_num=?";
		    pstmt = con.prepareStatement(sql);
		    pstmt.setInt(1, board_num);
		    
		      rs= pstmt.executeQuery();
		  
		    if(rs.next()) {
		    	int boardNum = rs.getInt("board_num");
		    	String title = rs.getString("title");
		    	String content = rs.getString("content");
		    	String writer = rs.getString("writer");
		    	Date bdate = rs.getDate("bdate");
				Date mdate = rs.getDate("mdate");
		    	int hit = rs.getInt("hit");
		    	
		    	board = new BoardVO(boardNum, title, content, writer, bdate, mdate, hit);
		    }
			
		    
		}catch(Exception e) {
		 e.printStackTrace();
		 
	}finally {
		try {
			con.close();
			pstmt.close();
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	return board;
	}
}
