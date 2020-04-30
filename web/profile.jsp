<%-- 
    Document   : profile
    Created on : 30 Apr, 2020, 2:16:37 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="connection.jsp" %>
<%
    Statement stmnt=null;
    ResultSet rs1=null,rs2=null;
    Connection con=null;
    try{
        con=DriverManager.getConnection(url+dbname,userID,pwd);
        stmnt=con.createStatement();
        String sql1="SELECT * FROM USERS WHERE EMAIL='"+session.getAttribute("userid")+"'";
        rs1=stmnt.executeQuery(sql1);
        
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account</title>
        <style>
            .proCls1{
                float: left;
                margin: 2% 10% 2% 10%;
                border:solid 2px black;
                width: 40%;
                height: auto;
                background: lightgoldenrodyellow;
            }
            .proCls2{
                margin: 2% 2% 2% 2%;
            }
            hr{
                margin: 1%;
            }
            .proCls2 p{
                font-size:30px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="proCls1">
            <div class="proCls2">
                <%
                
                rs1.next();
                %>
                <p>Name : <%out.print(rs1.getString("name")); %></p>
                <hr>
                <p>Email : <%out.print(rs1.getString("email")); %></p>
                <hr>
                <p>Mobile : <%out.print(rs1.getString("mobile")); %></p>
                <hr>
                <p>City : <%out.print(rs1.getString("city")); %></p>
                <hr>
                <p>Address:</p>
                <hr>
                <%
                    String sql2="SELECT ADDRESS FROM ADDRESS WHERE UID='"+session.getAttribute("userid")+"'";
                    rs2=stmnt.executeQuery(sql2);
                    if(rs2!=null){
                        while(rs2.next())
                        {
                            %>
                                <p style="font-size: 20px;"><% out.print(rs2.getString("address"));%></p>
                            <%
                        }
                    }
                %>
            </div>
            
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
