<%-- 
    Document   : Admin
    Created on : 5 Oct, 2020, 12:57:27 PM
    Author     : KishanVenky
--%>

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
        <li><a href="index.html">Home</a></li>
        <li class="active"><a href="Admin.jsp">Admin</a></li>
      
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
      <li><a href="#">Home</a></li>
      <li>&#187;</li>
      <li  class="current"><a href="#">Admin</a></li>
  
    </ul>
  </div>
  <!-- ####################################################################################################### -->
  <div id="container">
    <div id="content">
      <h1>Admin Login Here</h1>
      <form action="LoginAction.jsp" method="post">
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>UserName</th>
            <th>password</th>
           
          </tr>
        </thead>
        <tbody>
          <tr class="light">
              <td><input type="text" name="uname" required=""></td>
           <td><input type="password" name="pwd" required=""></td>
          
          </tr>
          
         
          <tr class="dark">
            <td><input type="submit" value="Submit"></td>
               <td><input type="reset" value="Reset"></td>
           
          </tr>
        </tbody>
      </table>
    </form>
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
  <br class="clear" />
</div>
</body>
</html>