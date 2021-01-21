
<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.io.PrintWriter" %><%--

  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/10/09
  Time: 3:39 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="commentVO" class="com.webweak.vo.CommentVO"/>
<jsp:setProperty name="commentVO" property="bdNo"/>
<jsp:setProperty name="commentVO" property="cmUserId"/>
<jsp:setProperty name="commentVO" property="cmContent"/>





<%

    int rs = new Board().commentWrite(commentVO);
    PrintWriter script = response.getWriter();
    if (rs == 1){
        script.println(1);
    }else {
        script.println(0);
    }

%>