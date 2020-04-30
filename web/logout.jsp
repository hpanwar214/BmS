<%-- 
    Document   : logout
    Created on : 18 Apr, 2020, 4:02:07 PM
    Author     : Harshit
--%>

<%
   session.invalidate();
   response.sendRedirect("index.jsp");
%>
