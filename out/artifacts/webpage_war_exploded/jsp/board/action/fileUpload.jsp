<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.webweak.dao.Board" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/10/12
  Time: 7:39 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    // 파일 저장할 경로
    String path = request.getSession().getServletContext().getRealPath("upload");
    // 파일 크기 지정
    int maxSize = 1024*1024*10;
    // 서버 저장 파일 이름
    String file = "";
    // 원본 파일 이름
    String ogFile = "";
    try{
        MultipartRequest multi = new MultipartRequest(request, path, maxSize, new DefaultFileRenamePolicy());

        // form 태그 태그 값
        Enumeration files = multi.getFileNames();
        // form 태그 String 형변환
        String str = (String) files.nextElement();

//        file = multi.getFilesystemName(str);
        ogFile = multi.getOriginalFileName(str);

    }catch (Exception e){
        System.out.println("MultipartRequest : "+e.getMessage());
    }

    // String 리턴 받을 료없음 void 변경 예정
    String fileName = new Board().fileUpload(path,ogFile);


%>