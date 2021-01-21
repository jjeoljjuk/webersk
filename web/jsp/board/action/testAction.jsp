<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.Part" %>
<%@ page import="com.webweak.dao.Board" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%
    // 인코딩
    request.setCharacterEncoding("euc-kr");
%>
<%



//    // 파일 저장할 경로
//    String path = request.getSession().getServletContext().getRealPath("upload");
//    // 파일 크기 지정
//    int maxSize = 1024*1024*10;
//    // form 태그 name 값
//    String file = "";
//
//try{
//    MultipartRequest multi = new MultipartRequest(request,path,maxSize,new DefaultFileRenamePolicy());
//
//    Enumeration files = multi.getFileNames();
//    String str = (String) files.nextElement();
//    file = multi.getFilesystemName(str);
//
//    System.out.println("Enumeration : "+files);
//    System.out.println("str : "+str);
//    System.out.println("file : "+file);
//
//
//}catch (Exception e){
//    System.out.println(e.getMessage());
//}


%>

