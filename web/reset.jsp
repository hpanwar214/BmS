<%-- 
    Document   : reset
    Created on : May 24, 2020, 8:34:10 PM
    Author     : Ayush
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@include file="connection.jsp" %>
<%
    String email=request.getParameter("login");
    String password=request.getParameter("password");
    String username1=request.getParameter("username1");
    String username2=request.getParameter("username2");
    
    
    Connection con=null;
    Statement statement=null;
    try{
        if(!email.equals(""))
        {
            con=DriverManager.getConnection(url);
            statement=con.createStatement();
            String sql="SELECT EMAIL, MOBILE, PASSWORD FROM USERS WHERE EMAIL='"+email+"' OR MOBILE='"+email+"'" ;  
            ResultSet rs= statement.executeQuery(sql);
            if(rs!=null)
            {

                if(rs.next()){
                    email=rs.getString("email");
                    String mobile=rs.getString("mobile");
                    String realPwd=rs.getString("password");
                    if(realPwd.equals(password)){
                        
                        if(!username1.equals("")){
                            
                            if(!username2.equals("")){
                                
                                if(username1.equals(username2)){
                                    
                                   con=DriverManager.getConnection(url+dbname,userID,pwd);
                                   statement=con.createStatement();
                                   String sql1="UPDATE USERS SET PASSWORD='"+username1+"' WHERE EMAIL='"+email+"' OR MOBILE='"+email+"'" ;  
                                   int x=statement.executeUpdate(sql1);
                                   if(x>0)
                                   {
                                       %>
                                       <script>
                                       alert("Congratulation update correct")
                                       </script>
                                       <%
                                       response.sendRedirect("login.jsp");
                                   }
                                   else{
                                   %>
                                       <script>
                                       alert("Not Update")
                                       </script>
                                       <%
                                       response.sendRedirect("reset.jsp");
                                       
                                   } 
                                
                                }
                                else{
                                   %>
                                    <script>
                                         alert("Password Not Matched")
                                    </script>
                                    <%
                                    }
                            
                            }
                            else{
                                %>
                                <script>
                                 alert("Invalid Password")
                                </script>
                                <%
                            }
                        }
                        else{
                        %>
                        <script>
                            alert("Invalid Password")
                        </script>
                        <%
                        }
                        
                        
                        
                    }
                    else{
                        %>
                        <script>
                            alert("Invalid Email or password")
                        </script>
                        <%
                    }
                }

            }
            else 
            {
                %>
                <script>
                    alert("Email or Mobile number not found")
                </script>
                <%
            }
        }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
%>
<html>    
    <head>    
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="logStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <style>
#msg {
       visibility: hidden;
    min-width: 250px;
    
    background-color:greenyellow;
    color: #000;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    right: 30%;
    top: 30px;
    font-size: 17px;
	margin-right:50px;
}

#msg.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {top: 0; opacity: 0;} 
    to {top: 30px; opacity: 1;}
}

@keyframes fadein {
    from {top: 0; opacity: 0;}
    to {top: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {top: 30px; opacity: 1;} 
    to {top: 0; opacity: 0;}
}

@keyframes fadeout {
    from {top: 30px; opacity: 1;}
    to {top: 0; opacity: 0;}
}

body
{
    font-family: Tahoma, Geneva, sans-serif;
    color: #fff;
    background: url("myimages/back1.jpg");
    background-size: cover;
}
a
{
    color: yellow;
    text-decoration: blink;
    font-family: Tahoma, Geneva, sans-serif;
    margin-left: 35px;
}
.reset
{
    background: rgba(44,62,80,0.7);
    padding: 40px;
    width: 330px;
    height: 480px;
    margin-left: 180px;
    margin: 0 auto;
    margin-top: 120px;
}
h2
{
    border: none;
    background: black;
    color: red;
    font-size: 16px;
    line-height: 25px;
    padding: 10px 0;
    border-radius: 12px;
    cursor: pointer;
    width: 180px;
    margin-left: 30px;
}
input[type=password]
{
    width: 240px;
    background: transparent;
    border: none;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 16px;
    font-weight: 200px;
    padding: 10px 0;
    transition: border 0.5s;
    text-align: center;
    color: white;
}
input[type=text]
{
    width: 240px;
    background: transparent;
    border: none;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 16px;
    font-weight: 200px;
    padding: 10px 0;
    transition: border 0.5s;
    text-align: center;
    color: white;
}
input[type=submit]
{
    border: none;
    background: white;
    color: black;
    font-size: 16px;
    line-height: 25px;
    padding: 10px 0;
    border-radius: 12px;
    cursor: pointer;
    width: 180px;
    margin-left: 30px;
}
input[type=submit]:hover
{
    background: black;
    color: white;
}
::placeholder {
    color:aliceblue;
    opacity: 0.8; /* Firefox */
}


</style>
</head>

<body>
<div class="reset">

    <form name="myForm" action="reset.jsp" onsubmit="return validate();" method="POST">
<h2 align="center" style="color:#fff;">Reset password</h2>
<input type="text" name="login" placeholder="Email or Mobile number" ><br /><br />
<input type="password" name="password" placeholder="Old password" required/><br /><br />
<input type="password" name="username1" placeholder="New password" required/><br /><br />
<input type="password" name="username2" placeholder="Confirm new password" required/><br /><br />
<input type="submit" value="Save"/><br /><br />
<a href="login.jsp" style="text-decoration:none;"><h4>Go back to Home page</h4></a><br /><br />
<div id="msg">Your password changed successfully!!</div>

    <script>
        

          function validate() 
             {
                 if( document.myForm.login.value == "" ) 
                 {
                    alert( "Please provide your Email or Mobile number" );
                    document.myForm.login.focus() ;
                    return false;
                 }   
                 if( document.myForm.password.value == "" ) 
                 {
                    alert( "Please provide your older password!" );
                    document.myForm.password.focus() ;
                    return false;
                 }                 
                 if( document.myForm.username1.value == "" )
                 {
                    alert( "Please provide your Password" );
                    document.myForm.username1.focus() ;
                    return false;
                 }
                  if( document.myForm.username2.value == "" )
                 {
                    alert( "Please provide your Password" );
                    document.myForm.username2.focus() ;
                    return false;
                 }                 
                          
                 if(document.myForm.password.value.length<8)
                 {
                     alert( "password should be length greater than 8" );
                    document.myForm.password.focus() ;
                    return false;
                 }
                 if(document.myForm.username1.value.length<8)
                 {
                     alert( "password should be length greater than 8" );
                    document.myForm.username1.focus() ;
                    return false;
                 }
                 if(document.myForm.username2.value.length<8)
                 {
                     alert( "password should be length greater than 8" );
                    document.myForm.username2.focus() ;
                    return false;
                 }
                   var a=document.myForm.username1.value;
                   var b=document.myForm.username2.value;
                 if(a!=b)
                 {
                    alert( "password must match" );
                    document.myForm.username2.focus()
                    return false;
                 }
                 return true ;
             } 
    </script>
    <% con.close();%>
</form>
</div>
</body>
</html>