<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/10/01
  Time: 2:34 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String[] idx = request.getParameterValues("idx[]");


    int result = 0;
    for (int i = 0;i<idx.length;i++){
        result = new Board().delete(idx[i]);
    }
    PrintWriter script = response.getWriter();

    if (result == 1){
        script.println(1);
    }else {
        script.println(0);
    }


%>