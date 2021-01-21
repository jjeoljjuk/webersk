<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>

<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/10/01
  Time: 3:00 오전
  To change this template use File | Settings | File Templates.
--%>

<jsp:useBean id="boardVO" class="com.webweak.vo.BoardVO"/>
<jsp:setProperty name="boardVO" property="bdTitle"/>
<jsp:setProperty name="boardVO" property="bdUserId"/>
<jsp:setProperty name="boardVO" property="bdContent"/>
<%
    String bdNo = request.getParameter("bdNo");
    boardVO.setBdNo(bdNo);

    int result = new Board().update(boardVO);
    PrintWriter script = response.getWriter();
    script.println("<script>");
    if (result == 1){
        script.println("alert('수정 완료')");
        script.println("location.href = '../view/choice.jsp?bdNo="+bdNo+"';");
    }else {
        script.println("alert('수정 실패')");
        script.println("window.history.back();");
    }

    script.println("</script>");

%>