<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="db.DbClass" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
    <%
   String name,email,subject,memo,sex;
   //name=request.getParameter("name");
   name=(String)session.getAttribute("username");
   sex=request.getParameter("sex");
   email=request.getParameter("email");
   subject=request.getParameter("subject");
   memo=request.getParameter("memo");
   try{
   Connection conn=new DbClass().getConn();
   String sql="insert into messa(name,email,subject,memo) values(?,?,?,?)";
   PreparedStatement pst=conn.prepareStatement(sql);
    pst.setString(1,name);
    pst.setString(2,email);
    pst.setString(3,subject);
    pst.setString(4,memo);
    int result =pst.executeUpdate();
     if(result>0)
       {
        out.println("���Է���ɹ���");
        out.println("<a href='index.jsp'>��������</a>");
       }else{
          out.println("���Է���ʧ�ܣ�");
          }
   }catch(Exception ex){
     ex.printStackTrace();
    }
    %>
  </body>
</html>
