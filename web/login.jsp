<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%
    if(session.getAttribute("userid")!=null)
        {
            response.sendRedirect("logout.jsp");
            return;            
        }
%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>

<%
    String email=request.getParameter("login");
    String password=request.getParameter("password");
    //
    String driverName="org.apache.derby.jdbc.ClientDriver";
    String url="jdbc:derby://localhost:1527/";
    String dbname="BookService";
    String userID="root";
    String pwd="123";
    try{
        Class.forName(driverName);
    }
    catch(ClassNotFoundException e)
    {
        e.printStackTrace();   
    }
    
    Connection con=null;
    Statement statement=null;
    try{
        if(!email.equals(""))
        {
            con=DriverManager.getConnection(url+dbname,userID,pwd);
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
                        request.getSession(true);
                        session.setAttribute("userid",email);
                        System.out.println(session.getAttribute("userid").toString()+" welcome");
                        response.sendRedirect("index.jsp");
                    }
                    else
                    {
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
            
body
{
    font-family: Tahoma, Geneva, sans-serif;
    color: #fff;
    background: url("myimages/hod.jpg"); 
    background-size: cover;
}
.signin
{
    background: rgba(44,62,80,0.7);
    padding: 40px;
    width: 350px;
    margin: auto;
    margin-top: 90px;
    height: 400px;
    margin-left: 180x;
    
}
form
{
    width: 240px;
    text-align: center;
}
input[type=text]
{
    width: 240px;
    text-align: center;
    background: transparent;
    border: none;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 16px;
    font-weight: 200px;
    padding: 10px 0;
    transition: border 0.5s;
    outline: none;
    color: #fff;
}
input[type=password]
{
    width: 240px;
    text-align: center;
    background: transparent;
    border: none;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 16px;
    font-weight: 200px;
    padding: 10px 0;
    transition: border 0.5s;
    outline: none;
    color: #fff;
}
input[type=submit]
{
    border: none;
    width: 190px;
    background: white;
    color: #000;
    font-size: 16px;
    line-height: 25px;
    padding: 10px 0;
    border-radius: 15px;
    cursor: pointer;
}
input[type=submit]:hover
{
    color: #fff;
    background-color: black;
}
h2
{
    color: white;
    
}
a
{
    color: yellow;
    text-decoration: blink;
}
a:hover
{
    color: skyblue;
}
.container
{
    display: flex;
    flex-direction: row;
    width: 100%;
}
::placeholder {
    color:aliceblue;
    opacity: 0.8; /* Firefox */
}

.textbox i{
    width: 26px;
    float:left;
    text-align: center;
}
            
        </style>    
        
        
        
    </head>
    <body>
    
       <div class="signin">                
                <form  name="login_form" method="post" action="login.jsp" onsubmit="return validate();">
                    
                    <h2 style="color:white">Log In</h2>
                                
                    <input type="text" name="login" placeholder="Email or Mobile number" >

            
                
                    <input type="password" name="password" placeholder="Password" ><br><br>
        
                 <input type="submit" name="commit" value="Login"><br><br>
                  
                  <div id="container">
                      
                  <a href="reset.jsp" style=" margin-right:0px; font-size:13px; font-family:Tahoma, Geneva, sans-serif;">Reset password?</a>
    <a href="forget.jsp" style=" margin-left:30px; font-size:13px; font-family:Tahoma, Geneva, sans-serif;">Forget password</a>
    </div><br /><br /><br />
                 Don't have account?<a href="contact.jsp" >&nbsp;Sign Up</a>

                  
                </form>
                
       </div>
          
        <script>
        function validate()
        {
            if( document.login_form.login.value == "" ) 
                 {
                    alert( "Please type Valid Email or Mobile number" )
                    document.login_form.login.focus() ;
                    return false;
                 }     
                  if( document.login_form.password.value == "" ) 
                 {
                    alert( "Please type Correct password") 
                    document.login_form.password.focus() ;
                    return false;
                 }  
                 
                var cred = document.login_form.login.value;
                var atpos = cred.indexOf("@");
                var dotpos = cred.lastIndexOf(".");

                 if (atpos < 1 || ( dotpos - atpos < 2 )) 
                 {
                     if(cred.length==10)
                         return true;
                     
                    alert("Please enter correct email ID or Phone Number")
                    document.login_form.login.focus() ;
                    return false;
                 }
                 
                 
                 
                 return true ;
        }
    </script>
        
      
    </body>
</html>