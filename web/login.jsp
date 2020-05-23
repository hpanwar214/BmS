 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("userid")!=null)
        {
            System.out.println("welcome to request"); 
            response.sendRedirect("logout.jsp");
            return;
        }
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
                        session.setAttribute("order", 0);
                        System.out.println(session.getAttribute("userid").toString()+" welcome");
                        response.sendRedirect("index.jsp");
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
    <script type="test/javascript">
        function validate()
        {
                cred = document.loginform.login.value;
                atpos = cred.indexOf("@");
                dotpos = cred.lastIndexOf(".");

                 if (atpos < 1 || ( dotpos - atpos < 2 )) 
                 {
                     if(cred.length==10)
                         return true;
                     
                    alert("Please enter correct email ID or Phone Number")
                    document.myForm.email.focus() ;
                    return false;
                 }
                 return true ;
        }
    </script>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="logStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
       <%@include file="header.jsp" %>
       <div class="login">
                <h1>Login to Web App</h1>
                <form method="post" action="login.jsp" onsubmit="return validate();" name="login_form">
                  <p><input type="text" name="login" value="" placeholder="mobile or Email"></p>
                  <p><input type="password" name="password" value="" placeholder="Password"></p>
                  <p class="remember_me">
                    <label>
                      <input type="checkbox" name="remember_me" id="remember_me">
                      Remember me on this computer
                    </label>
                  </p>
                  <p class="submit"><input type="submit" name="commit" value="Login"></p>
                </form>
                <div class="login-help">
                    <p><a href="signup.html">Not Registered</a>.</p>
                    <p>Forgot your password? <a href="#">Click here to reset it</a>.</p>
                </div>
          </div>

          
        
        
        <%@ include file = "footer.jsp" %>
    </body>
</html>
