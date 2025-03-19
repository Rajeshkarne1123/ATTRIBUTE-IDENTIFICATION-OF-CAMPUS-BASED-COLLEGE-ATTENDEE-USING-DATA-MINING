




<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.database.Dbconnection"%>
<%

String Query="select * from dataset";
Connection con=Dbconnection.getcon();
Statement st=con.createStatement();
%>

<table style="border:1px dodgerblue" border="1">

          <tr>
              <th>Sr.No</th>
              <th>Gender</th>    
              <th>Nationality</th>
              <th>PlaceOfBirth</th>
              <th>StageID</th>
              <th>GrageID</th>
               <th>SectionID</th>
              <th>Topic</th>
              <th>Semester</th>
              <th>Relation</th>
              <th>RaisedHand</th>
              <th>Visited Resources</th>
              <th>Announcement View</th>
              <th>Discussion</th>
              <th>ParentAnsweringSurvey</th>
                <th>ParentschoolSatisfaction</th>
              <th>StudentAbsenceDays</th>
                <th>Class</th>
              
          </tr>
         
<%
ResultSet rr=st.executeQuery(Query);
int c=0;
 
        while(rr.next()){
            c=c+1;
    %>
     <tr>
    <td><%=c%></td>
   <td><%=rr.getString(2)%></td>
   <td><%=rr.getString(3)%></td>
   <td><%=rr.getString(4)%></td>
   <td><%=rr.getString(5)%></td>
   <td><%=rr.getString(6)%></td>
   <td><%=rr.getString(7)%></td>
   <td><%=rr.getString(8)%></td>
   <td><%=rr.getString(9)%></td>
   <td><%=rr.getString(10)%></td>
   <td><%=rr.getString(11)%></td>
   <td><%=rr.getString(12)%></td>
   <td><%=rr.getString(13)%></td>
   <td><%=rr.getString(14)%></td>
   <td><%=rr.getString(15)%></td>
   <td><%=rr.getString(16)%></td>
   <td><%=rr.getString(17)%></td>
     <td><%=rr.getString(18)%></td>
       </tr>  
    <%
}



%>             
              
      
              
              
</table>