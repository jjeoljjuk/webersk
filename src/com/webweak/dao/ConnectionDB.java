package com.webweak.dao;


import com.webweak.vo.PagingActionVO;
import com.webweak.vo.PagingVO;

import java.sql.*;


public class ConnectionDB {


    public Connection conn = null; // 데이터 연결 객체
    public Statement stmt = null; // SQL 해석
    public PreparedStatement pstmt = null; // 데이터 Input 객체
    public ResultSet rs = null; // 데이터 불러오는 객체


    public ConnectionDB() {

        try {

            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@192.168.196.157:1521:orcl";
            String user = "dong7578";
            String password = "12345";

            // DB 연동 여부 확인
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();

        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 로딩 실패");
            System.out.println("ClassNotFoundException : "+e.getMessage());
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            System.out.println("SQLException : "+e.getMessage());
        }
    }


    public ResultSet dbResult(String query) throws SQLException {

        pstmt = null;
        rs = null;



            stmt = conn.createStatement();
             rs = stmt.executeQuery(query);

            return rs;

    }


    public void clean () throws SQLException {

            if (rs != null) {
                rs.close();
            }

            if (stmt != null){
                stmt.close();
            }

            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }


    }

    public PagingActionVO paging(PagingVO pagingVO){


         int pageMax = pagingVO.getPageMax();  // 한페이지에 보일 게시물 수
         int BLOCK = pagingVO.getBlock(); // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

        int total = pagingVO.getTotal(); // 게시글 Size
        int pg = pagingVO.getPg(); //기본 페이징 값



        int pageStart = (pg*pageMax) - (pageMax-1); // 해당페이지에서 시작번호(step2)
        int pageEnd = (pg*pageMax); // 해당페이지에서 끝번호(step2)

        int allPage = 0; // 전체 페이지수

        int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
        int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)

        allPage = (int)Math.ceil(total/(double)pageMax);

        if(endPage > allPage) {
            endPage = allPage;
        }


        return new PagingActionVO(pageStart,pageEnd,startPage,endPage);
    }

}
