<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/10/09
  Time: 9:50 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bdNo = request.getParameter("bdNo");
    String cmNo = request.getParameter("cmNo");
    String sId = request.getParameter("sId");

    PrintWriter script = response.getWriter();

    int res = new Board().commentDelete(bdNo,cmNo,sId);
    script.println("<script>");
    if(res ==1){
        script.println("history.back()");
    }else{
        script.println("history.back()");
    }
    script.println("</script>");
%>
