<%-- 
    Document   : footer
    Created on : 22 Mar, 2020, 4:20:50 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .foot
        {
            margin-top: 10px;
            width: 100%;
            height: auto;
            min-height: 10%;
            background: black;
            color: white;
            float:left;
            
        }
        a{
            color: gray;
        }
        .texty
        {
            margin-top: .5%;
            margin-bottom: .5%;
            margin-left: 30%;
            margin-right: 30%;
            float:left;
            
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="foot">
            <div class="texty">
                
                <p>All Copyrights Issued. For Contacts mails us at <a href="#">mail@bookmyservice.com</a></p> 
                <p>
                <%
                    if(session.getAttribute("userid")!=null){
                        %>
                        <a href="logout.jsp">Logout</a>
                        <%
                    }
                 %>
                </p>
                <p><a href="serviceMan.jsp">Register as Service Man</a></p>
                
            </div>
        </div>
    </body>
</html>
