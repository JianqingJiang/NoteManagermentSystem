<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="db.DbClass" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看所有回复</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
      String name,subject,reply,time;
      subject=(String)request.getParameter("subject");
      Connection conn=new DbClass().getConn();
      Statement smt=conn.createStatement();
       String sql="select * from replytable where subject=?";
      PreparedStatement pst=conn.prepareStatement(sql);
      pst.setString(1,subject);
      ResultSet rs;
      rs=pst.executeQuery();
      out.print("<center>"); 
      out.print("<table border=1>");
      out.print("<tr>");
      out.print("<td bgcolor=yellow>回复人姓名</td>");
      out.print("<td bgcolor=yellow>主题</td>");
      out.print("<td bgcolor=yellow>回复内容</td>");
      out.print("<td bgcolor=yellow>回复时间</td>");  
      while(rs.next()) 
    { 
    name=rs.getString(1); 
    subject=rs.getString(2); 
    reply=rs.getString(3);  
    time=rs.getString(4); 
//out.print("<center>"); 
//out.print("<table border=1>"); 
out.print("<tr>");
out.print("<td>"+name+"</td>"); 
out.print("<td>"+subject+"</td>"); 
out.print("<td>"+reply+"</td>"); 
out.print("<td>"+time+"</td>");
out.print("</tr>");
//out.print("</table><p>"); 
} 

out.print("</table><p>"); 
out.print("<a href='showall.jsp'>返回查看留言页面</a>");
 %>
  </body>
</html>
