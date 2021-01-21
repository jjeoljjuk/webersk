
<%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/09/05
  Time: 9:14 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import="com.webweak.dao.Member" %>
<%@ page import="java.io.PrintWriter" %>
<%


    String userId = request.getParameter("uid");



    Member join = new Member();
    int result = join.idCheck(userId);

    out.println(result);

%>
