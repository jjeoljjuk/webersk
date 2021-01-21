<%@ page import="java.util.ArrayList" %>
<%@ page import="com.webweak.dao.Address" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webweak.vo.AddressVO" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/09/05
  Time: 9:14 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="addressVO" class="com.webweak.vo.AddressVO"/>
<jsp:setProperty name="addressVO"  property="findD"/>
<jsp:setProperty name="addressVO"  property="findG"/>
<jsp:setProperty name="addressVO"  property="findDG"/>
<jsp:setProperty name="addressVO"  property="findN1"/>
<jsp:setProperty name="addressVO"  property="findN2"/>
<%

    Address ar = new Address();
    List<AddressVO> data = (ArrayList) ar.specificBtn(addressVO);



    for (int i=0;i<data.size();i++){

        String result = "[지번]"+data.get(i).getFindD()+" | "+data.get(i).getFindG()+" | "+data.get(i).getFindDG()+" | "+data.get(i).getFindN1()+"-"+data.get(i).getFindN2();
        out.print("<a onclick='searchResult(\""+result+"\")'>");
        out.print("[지번] "+data.get(i).getFindD()+" | ");
        out.print(data.get(i).getFindG()+" | ");
        out.print(data.get(i).getFindDG()+" | ");
        out.print(data.get(i).getFindN1()+"-");
        out.print(data.get(i).getFindN2());
        out.print("</a>");
        out.print("<br>");

        if (i == 30){
            break;
        }



    }




%>

