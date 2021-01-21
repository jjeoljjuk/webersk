<%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/08/18
  Time: 6:25 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.webweak.dao.Member" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.webweak.dao.ConnectionDB" %>
<%@ page import="com.webweak.vo.SessionVO" %>
<jsp:useBean id="userVO" class="com.webweak.vo.UserVO"/>
<jsp:setProperty name="userVO" property="userId"/>
<jsp:setProperty name="userVO" property="userPw"/>
<%





    PrintWriter script = response.getWriter();
    SessionVO result =  new Member().loginCheck(userVO);


    script.print("<script>");
    if (result.getResult() == 200){
    script.print("alert('로그인 성공');");
    session.setAttribute("id",result.getUserId());
    script.print("location.href = '/index.jsp';");
    }else if (result.getResult() == 500){
        script.print("alert('회원 정보가 없습니다.');");
        script.print("history.back();");
    }
    script.print("</script>");




%>

