<%@ page import="java.util.ArrayList" %>
<%@ page import="com.webweak.dao.Address" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/09/05
  Time: 9:14 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>


<%
    String choice = request.getParameter("choice");

    if(choice.equals("") == false){
        Address ar = new Address();
        ArrayList<String> data = (ArrayList<String>) ar.Specific(choice);

        for (int i=0;i<data.size();i++){
            out.print(data.get(i)+",");
        }
    }
%>

