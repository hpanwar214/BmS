<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%
    String driverName="org.postgresql.Driver";
    String url="jdbc:postgresql://ec2-18-210-214-86.compute-1.amazonaws.com:5432/d4r9kf5b4sto41?password=ee7b4421dbb63ce652628e1914b45d8f3dff120ec1090df11f4b5ce96bb53b27&sslmode=require&user=ejrzyuctngrchx";
    /*String dbname="d4r9kf5b4sto41";
    String userID="ejrzyuctngrchx";
                   ejrzyuctngrchxd4r9kf5b4sto4
    String pwd="ee7b4421dbb63ce652628e1914b45d8f3dff120ec1090df11f4b5ce96bb53b27";*/
    try
    {
        Class.forName(driverName);
    }
    catch(ClassNotFoundException e)
    {
        e.printStackTrace();   
    }
%>
