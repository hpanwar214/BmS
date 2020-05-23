<%@ include file="connection.jsp" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("userid")!=null)
        {
            System.out.println("welcome to request"); 
            response.sendRedirect("logout.jsp");
            return;
        }
    String name=request.getParameter("username");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String city=request.getParameter("city");
    String service=request.getParameter("service");
    String img=request.getParameter("img");
    String password=request.getParameter("password");
    String aadhar=request.getParameter("aadhar");
    
    Connection con=null;
    Statement stmnt=null;
    try{
        if(!email.equals(""))
        {
            con=DriverManager.getConnection(url+dbname,userID,pwd);
            stmnt=con.createStatement();
            String sql="INSERT INTO SERVICEMAN(NAME,EMAIL,CITY,IMAGE,AADHAR,PASSWORD,SERVICE,MOBILE) VALUES('"+name+"','"+email+"','"+city+"','"+img+"','"+aadhar+"','"+password+"','"+service+"','"+mobile+"')";     
            stmnt.executeUpdate(sql);
            response.sendRedirect("service.jsp");
        
        }
            
    }
    catch(Exception e)
    { 
        e.printStackTrace();
    }
    
    
%>



<html>
    
    <head>
        <title>SignUp ServiceMan</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="sigStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function validateEmail() 
            {
                 emailID = document.myForm.email.value;
                 atpos = emailID.indexOf("@");
                 dotpos = emailID.lastIndexOf(".");

                 if (atpos < 1 || ( dotpos - atpos < 2 )) 
                 {
                    alert("Please enter correct email ID")
                    document.myForm.email.focus() ;
                    return false;
                 }
                 return true ;
             }
             function validate() 
             {
                 if( document.myForm.username.value == "" ) 
                 {
                    alert( "Please provide your name!" );
                    document.myForm.name.focus() ;
                    return false;
                 }                 
                 if( document.myForm.email.value == "" )
                 {
                    alert( "Please provide your Email!" );
                    document.myForm.email.focus() ;
                    return false;
                 }
                 else if(!validateEmail())
                 {
                    return false;
                 }
                 var phone=/^\d{10}$/;
                 if(!document.myForm.mobile.value.match(phone))
                 {
                     alert("Mobile No. Incorrect");
                     document.myForm.mobile.focus() ;
                    return false;
                 }
                 
                 var adhar=/^\d{12}$/;
                 if(!document.myForm.aadhar.value.match(adhar))
                 {
                     alert("Invalid Aadhar Number");
                     document.myForm.aadhar.focus();
                     return false;
                 }               
                 if(document.myForm.password.value.length<8)
                 {
                     alert( "password should be length greater than 8" );
                    document.myForm.password.focus() ;
                    return false;
                 }
                 if(!document.myForm.img.value.endsWith(".jpeg")||!document.myForm.img.value.endsWith(".jpg")||!document.myForm.img.value.endsWith(".png"))
                 {
                     alert("Invalid Image Url")
                     document.myForm.img.focus() ;
                    return false;
                 }

                 if(!document.myForm.password.match(document.myForm.cpassword))
                 {
                    alert( "password must match" );
                    document.myForm.cpassword.focus()
                    return false;
                 }
                 
                 return true ;
             }

        </script>
        
        <style>
            input{
                width: 80%;
                height: 30px;
                margin-top: 10px;
                margin-bottom: 10px;
                margin-left: 10%;
                margin-right: 10%;
                border: black;
                border-width: 2px;
                float:left;
            }
            button{
                width:30%;
                background: greenyellow;
                float: left;
                margin-left: 35%;
                margin-right: 35%;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            .back{
                background: #5cb3fd;
                position: relative;
                margin-top:50px;
                height: 800px;
                width: 100%;;
                
                float: left;
            }
            div.jumbotron{
                width: 100%;
                height: 600px;
                margin-top: 100px;
            }
            #login-box{
                height: 700px;
            }
        </style>
    <body>
      <%@include file="header.jsp" %>
        <div style="float:left;width: 100%"> 
            <div class="col-md-3 col-sm-1"></div>
            <div id="login-box" class="col-md-4 col-sm-2" >
                
                    <div class="left">
                        <h1>Sign up</h1>
                        <form name="myForm" onsubmit="return validate()" method="POST" action="serviceMan.jsp">

                            <input type="text" name="username" placeholder="Username" required />
                            <input type="text" name="email" placeholder="E-mail" required  />
                            <input type="text" name="mobile" placeholder="Contact" required  />
                            <select id="city" name="city" >
                                <option value="Bhopal">Bhopal</option>
                                <option value="Indore">Indore</option>
                                <option value="Ujjain">Ujjain</option>
                                <option value="Gwalior">Gwalior</option>
                                <option value="Jabalpur">Jabalpur</option>
                                <option value="Ratlam">Ratlam</option>
                                <option value="Mandsaur">Mandsaur</option>
                                <option value="Dewas">Dewas</option>
                                <option value="Khandwa">Khandwa</option>
                                <option value="Khargone">Khargone</option>                                       
                            </select>
                            <select id="sercie" name="service" >
                                <option value="plumber">Plumber</option>
                                <option value="electrician">Electrician</option>
                                <option value="mechanic">mechanic</option>
                                <option value="Gargner">Gardener</option>
                                <option value="Technician">Technician</option>
                                <option value="Barber">Barber</option>
                                <option value="Carpenter">Carpenter</option>
                                <option value="Painter">Painter</option>
                                <option value="SPA">SPA</option>
                                <option value="Maids">Maids</option>                                       
                                <option value="Broker">Broker</option>                                       
                            </select>
                            <input type="text" name="aadhar" placeholder="Aadhar Number" required />
                            <input type="text" name="img" placeholder="Image URL" required  />
                        
                            <input type="password" name="password" placeholder="Password" required />
                            <input type="password" name="cpassword" placeholder="Retype password" required  />
                        
                        <input type="submit" name="signup_submit" value="Sign me up" style="margin-bottom:10px;" />
                        </form>
                    </div>
                
              
                    <div class="right">
                        <span class="loginwith">Sign in with<br />social network</span>
                        <a href="login.html" style="margin-left:40%;">Already Registered</a>
                        <button class="social-signin facebook">Log in with facebook</button>
                        <button class="social-signin twitter">Log in with Twitter</button>
                        <button class="social-signin google">Log in with Google+</button>
                    </div>
            </div>
            <div class="col-md-3 col-sm-1"></div>
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
