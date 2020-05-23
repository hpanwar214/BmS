<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%
    String driverName="org.apache.derby.jdbc.ClientDriver";
    String url="jdbc:derby://localhost:1527/";
    String dbname="BookService";
    String userID="root";
    String pwd="123";
    try
    {
        Class.forName(driverName);
    }
    catch(ClassNotFoundException e)
    {
        e.printStackTrace();   
    }
%>
