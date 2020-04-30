<%-- 
    Document   : cancel
    Created on : 28 Apr, 2020, 3:55:39 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <script>
        function  ready(){
            alert("Booking Canceled");
        }
    </script>
</html>
<%@include file='connection.jsp' %>
<%
    Statement stmnt=null;
    ResultSet rs1=null,rs2=null,rs3=null;
    Connection con=null;
    try
    {
        con=DriverManager.getConnection(url+dbname,userID,pwd);
        stmnt=con.createStatement();
        String bid=request.getParameter("bid");
        String sql="DELETE FROM BOOKINGS WHERE BID="+bid;
        stmnt.executeUpdate(sql);
        %>
        <script>
           ready();
        </script>
        <%
        response.sendRedirect("sales.jsp");    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
