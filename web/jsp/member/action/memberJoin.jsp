<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.webweak.dao.Member" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/09/04
  Time: 12:19 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="memberVO" class="com.webweak.vo.MemberVO"/>
<jsp:setProperty name="memberVO" property="userId"/>
<jsp:setProperty name="memberVO" property="userPw"/>
<jsp:setProperty name="memberVO" property="userName"/>
<jsp:setProperty name="memberVO" property="dateJoin"/>
<jsp:setProperty name="memberVO" property="gender"/>
<jsp:setProperty name="memberVO" property="email"/>
<jsp:setProperty name="memberVO" property="address"/>
<jsp:setProperty name="memberVO" property="phone"/>



<%
    Member member = new Member();
    int result = member.join(memberVO);

    PrintWriter script = response.getWriter();

    script.print("<script>");
    if (result == 200){

        script.println("location.href = '/index.jsp';");

    }else if (result == 500){
        script.print("<script>");
        script.println("history.back();");
        script.print("</script>");
    }
    script.print("</script>");


%>

