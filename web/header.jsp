<%-- 
    Document   : header
    Created on : 28 Apr, 2020, 5:05:02 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Service</title>
    </head>
    <body>
        <div class="nav1">
            <div class="navM">
                <div class="navL">
                    <img src='myimages/bms.png' style="width: 10%;height: 10%;margin:5px;">
                    <a href="index.jsp" style="color:white;">Book-My-Service</a>
                </div>
                <%
                    if(session.getAttribute("userid")==null)
                    {%>
                        <div class="navR">
                            <div><a href="signup.jsp"><button class="btns ">Sign Up</button></a></div>
                            <div><a href="login.jsp"><button class="btns" onmousemove="console">Login</button></a></div>

                        </div>
                    <%
                        
                    }
                    else{
                        %>
                        <div class="navR">
                            <div><a href="logout.jsp"><button class="btns ">Logout</button></a></div>
                            <div><a href="profile.jsp"><button class="btns" onmousemove="console">My Account</button></a></div>
                            <div><a href="rating.jsp"><button class="btns" onmousemove="console">My Services</button></a></div>

                        </div>
                        <%
                    }
                %>
                
            </div>
        </div>  
    </body>
</html>
