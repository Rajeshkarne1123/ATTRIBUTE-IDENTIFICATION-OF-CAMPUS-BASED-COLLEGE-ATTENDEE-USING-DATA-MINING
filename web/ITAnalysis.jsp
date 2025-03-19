<%-- 
    Document   : Admin
    Created on : 5 Oct, 2020, 12:57:27 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>Data Mining</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper"> 
  <!-- ####################################################################################################### -->
  <div id="header">
    <div class="fl_left" style="width:auto;">
      <h1><a href="#">ATTRIBUTE IDENTIFICATION OF CAMPUS BASED COLLEGE ATTENDEE USING DATA MINING</a></h1>
    </div>

    <br class="clear" />
  </div>
  <!-- ####################################################################################################### -->
  <div id="topbar">
    
    <div id="topbar">
  
    <div id="topnav" style="float:none;">
      <ul>
        <li><a href="AdminHome.jsp">Home</a></li>
        <li><a href="Upload.jsp">Upload Dataset</a></li>
        <li><a href="ViewDataset.jsp">View Dataset</a></li>
        <li class="active"><a href="Behaviour.jsp">Behaviour</a></li>
       <li><a href="Admin.jsp">Logout</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
    <br class="clear" />
  </div>
  <!-- ####################################################################################################### -->
  <div id="breadcrumb">
 <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="AdminHome.jsp">Home</a></li>
  <li>&#187;</li>
      <li ><a href="Behaviour.jsp">View Behaviour</a></li>
  <li>&#187;</li>
      <li><a href="AnalyzeTopic.jsp">Analyze Topic </a></li>
      <li>&#187;</li>
      <li  class="current"><a href="#">Topic Behavior</a></li>
  
    </ul>
  </div>
  <!-- ####################################################################################################### -->
  <div id="container">
    <div id="content">
      <h1>Topic Behavior Student and Parent</h1>
     <%@page import="java.sql.*"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="com.database.Queries"%>
<%
String query="delete from topic_2";
Queries.getExecuteUpdate(query);

try{
    String name=request.getParameter("name");
    Connection con=Dbconnection.getcon();
    Statement s=con.createStatement();
    Statement s1=con.createStatement();
    Statement s2=con.createStatement();
    Statement s3=con.createStatement();
    Statement s4=con.createStatement();
      Statement s5=con.createStatement();
        Statement s6=con.createStatement();
          Statement s7=con.createStatement();
        
    
   String q1="select sum(raisedhands) from dataset where topic='"+name+"'"; 
  ResultSet r=s.executeQuery(q1);
if(r.next()){
    String c=r.getString(1);
   String q11="insert into topic_2 values('"+name+"','raisedhands','"+c+"')"; 
  s.executeUpdate(q11);
}  
    String q11="select sum(VisitedResources) from dataset where topic='"+name+"'"; 
  ResultSet r1=s1.executeQuery(q11);
if(r1.next()){
    String c=r1.getString(1);
   String q111="insert into topic_2 values('"+name+"','VisitedResources','"+c+"')"; 
  s.executeUpdate(q111);
}  
    
String q111="select sum(AnnouncementsView) from dataset where topic='"+name+"'"; 
  ResultSet r11=s2.executeQuery(q111);
if(r11.next()){
    String c=r11.getString(1);
   String q1111="insert into topic_2 values('"+name+"','AnnouncementsView','"+c+"')"; 
  s.executeUpdate(q1111);
}  
    
String q1111="select sum(Discussion) from dataset where topic='"+name+"'"; 
  ResultSet r111=s3.executeQuery(q1111);
if(r111.next()){
    String c=r111.getString(1);
   String q11111="insert into topic_2 values('"+name+"','Discussion','"+c+"')"; 
  s.executeUpdate(q11111);
}  

String k="select count(ParentAnsweringSurvey) from dataset where topic='"+name+"' and ParentAnsweringSurvey='Yes'"; 
  ResultSet rs=s4.executeQuery(k);
if(rs.next()){
    int c=rs.getInt(1);
   String k1="insert into topic_2 values('"+name+"','ParentAnswer::YES','"+c+"')"; 
  s.executeUpdate(k1);
}  
    
String k2="select count(ParentAnsweringSurvey) from dataset where topic='"+name+"' and ParentAnsweringSurvey='No'"; 
  ResultSet rs1=s5.executeQuery(k2);
if(rs1.next()){
    int c=rs1.getInt(1);
   String k12="insert into topic_2 values('"+name+"','ParentAnswer::NO','"+c+"')"; 
  s.executeUpdate(k12);
}  



String k3="select count(ParentschoolSatisfaction) from dataset where topic='"+name+"' and ParentschoolSatisfaction='Good'"; 
  ResultSet rs3=s6.executeQuery(k3);
if(rs3.next()){
    int c=rs3.getInt(1);
   String k13="insert into topic_2 values('"+name+"','ParentSatisfy::GOOD','"+c+"')"; 
  s.executeUpdate(k13);
}  
    
String k23="select count(ParentschoolSatisfaction) from dataset where topic='"+name+"' and ParentschoolSatisfaction='Bad'"; 
  ResultSet rs13=s5.executeQuery(k23);
if(rs13.next()){
    int c=rs13.getInt(1);
   String k12="insert into topic_2 values('"+name+"','ParentSatisfy::BAD','"+c+"')"; 
  s.executeUpdate(k12);
} 
%>
<center>
<table border="1">
    <tr><th>Topic</th><th>Student & Parent Participated</th><th>No.Of Count</th></tr>
  <%
  String g="select * from topic_2";
  ResultSet rr=Queries.getExecuteQuery(g);
  while(rr.next()){
  %>
    <tr>
        <td><%=rr.getString("topic")%></td>
        <td><%=rr.getString("name")%></td>
        <td><%=rr.getString("count")%></td>
    </tr>

<%    
      
  }
  
  
  %>  
    
</table>
  





<iframe src="Topicwisegrph" width="1000" height="300"></iframe>

<a href="AnalyzeTopic.jsp">Back</a>
</center>
<%
}catch(Exception e){
   out.println(e); 
}





%>
      <div id="comments">
        
      </div>
      
      <div id="respond">
       
      </div>
    </div>
    <div id="column">
 
    </div>
    <br class="clear" />
  </div>
  <!-- ####################################################################################################### -->
  <div id="footer">
 
    <br class="clear" />
  </div>
  <!-- ####################################################################################################### -->
 
  <!-- ####################################################################################################### --> 
  <br class="clear" />
</div>
</body>
</html>