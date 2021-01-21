<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/10/21
  Time: 1:55 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 파일 저장할 경로
    String path = request.getSession().getServletContext().getRealPath("upload");
    String fileName = request.getParameter("fileName");

    String orgfilename = fileName;

    InputStream in = null;
    OutputStream os = null;
    File file = null;
    boolean skip = false;
    String client = "";





    try{
        // 파일을 읽어 스트림에 담기
        try{
            file = new File(path+"/"+fileName);
            in = new FileInputStream(file);
        }catch(FileNotFoundException fe){
            skip = true;
        }


        client = request.getHeader("User-Agent");

        // 파일 다운로드 헤더 지정
        response.reset() ;
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Description", "JSP Generated Data");

        if(!skip){


            // IE
            if(client.indexOf("MSIE") != -1){
                response.setHeader ("Content-Disposition", "attachment; filename="+new String(fileName.getBytes("KSC5601"),"ISO8859_1"));

            }else{
                // 한글 파일명 처리
                orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");

                response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
                response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
            }

            response.setHeader ("Content-Length", ""+file.length() );



            os = response.getOutputStream();
            byte b[] = new byte[(int)file.length()];
            int leng = 0;

            while( (leng = in.read(b)) > 0 ){
                os.write(b,0,leng);
            }

        }else{
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");

        }

        in.close();
        os.close();

    }catch(Exception e){
        e.printStackTrace();
    }



%>