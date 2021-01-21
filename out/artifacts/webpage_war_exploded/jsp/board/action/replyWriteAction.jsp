<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/10/10
  Time: 3:11 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="replyVO" class="com.webweak.vo.ReplyVO"/>
<jsp:setProperty name="replyVO" property="bdNo"/>
<jsp:setProperty name="replyVO" property="cmNo"/>
<jsp:setProperty name="replyVO" property="rlUserId"/>
<jsp:setProperty name="replyVO" property="rlContent"/>
<%

    int rs = new Board().replyWrite(replyVO);
    PrintWriter script = response.getWriter();
    if (rs == 1){
        script.println(1);
    }else {
        script.println(0);
    }
%>
