<%-- 
    Document   : Admin
    Created on : 5 Oct, 2020, 12:57:27 PM
    Author     : KishanVenky
--%>

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
      <li  class="current"><a href="AnalyzeGender.jsp">Gender Analysis </a></li>
  
    </ul>
  </div>
  <!-- ####################################################################################################### -->
  <div id="container">
    <div id="content">
      <h1>Welcome to Admin</h1>
      <center>
          <h4>Gender Analyze in Graph</h4>
          <%
          try{
              String q="delete from gender";
              Queries.getExecuteUpdate(q);
              
              
              String query="select count(*) from dataset where gender='M'";
              ResultSet r=Queries.getExecuteQuery(query);
              int c=0;
              while(r.next()){
                  c=r.getInt(1); 
              }
               String query1="select count(*) from dataset where gender='F'";
              ResultSet r1=Queries.getExecuteQuery(query1);
              int c1=0;
              while(r1.next()){
                  c1=r1.getInt(1); 
              }
              
             String mquery="insert into gender values('Male','"+c+"')";
              Queries.getExecuteUpdate(mquery); 
               String fquery="insert into gender values('FeMale','"+c1+"')";
              Queries.getExecuteUpdate(fquery); 
              
          }catch(Exception e){
            out.println(e);  
          }
          
          
          %>
          
        
          <table>
              <tr><th>Gender</th><th>No.of</th></tr>
               <%
               try{
                  String query13="select * from gender";
              ResultSet r12=Queries.getExecuteQuery(query13);
             
              while(r12.next()){
                %>
              <tr>
                  <td><%=r12.getString("name")%></td>
                  <td><%=r12.getString("count")%></td>
                 
              </tr>
              <%
              } 
               }catch(Exception e){
                 out.println(e);  
               }
               
               %> 
              
          </table> 
               <iframe src="GenderGraph" width="600" height="400"></iframe>
               <a href="Behaviour.jsp">Back</a>
      </center>
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