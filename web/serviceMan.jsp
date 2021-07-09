<%@ include file="connection.jsp" %>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%
    
    String name=request.getParameter("username");
    String email=(String)request.getParameter("email");
    System.out.println(" "+name+" "+email);
    String mobile=request.getParameter("mobile");
    String city=request.getParameter("city");
    String service=request.getParameter("service");
    String img="myimages/service/"+request.getParameter("img");
    String password=request.getParameter("password");
    String aadhar=request.getParameter("aadhar");
    boolean flag=false;
    Connection con=null;
    Statement stmnt=null;
    try{
        if(true)
        {
            con=DriverManager.getConnection(url);
            stmnt=con.createStatement();
            if(email.contains("@"))
            {String sql="INSERT INTO SERVICEMAN(NAME,EMAIL,CITY,IMAGE,AADHAR,PASSWORD,SERVICE,MOBILE) VALUES('"+name+"','"+email+"','"+city+"','"+img+"','"+aadhar+"','"+password+"','"+service+"','"+mobile+"')";     
            stmnt.executeUpdate(sql);
            response.sendRedirect("index.jsp");
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
        <title>SignUp ServiceMan</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="sigStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <script type="text/javascript">
            
                var realFileBtn = document.getElementById("real-file");
                
                customBtn.addEventListener("click", function() {
                realFileBtn.click();
                    });

               realFileBtn.addEventListener("change", function() {
                      if (realFileBtn.value) {
                          customTxt.innerHTML = realFileBtn.value
                     } else {
                       customTxt.innerHTML = "No file chosen, yet.";
                          }
                     });
                          
            
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
            
body
{
    font-family: Tahoma, Geneva, sans-serif;
    color: #fff;
    background: url("myimages/back1.jpg"); 
    background-size: cover;
}
.signin
{
    background: rgba(44,62,80,0.7);
    padding: 40px;
    width: 370px;
    margin: auto;
    margin-top: 90px;
    height: 695px;
    margin-left: 180x;
    
}
.ctear
{
    background: rgba(44,62,80,0.7);
    padding: 40px;
    width: 370px;
    margin: auto;
    margin-top: 90px;
    height: 695px;
    margin-left: 180x;    
 
  position: absolute;
  top: 0;
  right: 0;
  box-sizing: border-box;
  padding: 10px;
  width: 400px;
  height:300px;
  border-radius: 0 2px 2px 0;
  float:left;


    
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
input[type=file]
{
    width: 240px;
    text-align: center;
    background: transparent;
    border: none;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 18px;
    font-weight: 260px;
    padding: 10px 0;
    transition: border 0.5s;
    outline: none;
    color: lightblue;
}

select[id="city"]
{
    width: 240px;
    text-align: center;
    background: transparent;
    border: 2px;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 16px;
    font-weight: 300px;
    padding: 5px 0;
    transition: border 0.5s;
    outline: none;
    color: #fff;
}
select[id="sercie"]
{
    width: 240px;
    text-align: center;
    background: transparent;
    border: 2px;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 16px;
    font-weight: 300px;
    padding: 5px 0;
    transition: border 0.5s;
    outline: none;
    color: #fff;
}
option
{
    width: 240px;
    text-align: center;
    background: transparent;
    border: none;
    border-bottom: 1px solid #fff;
    font-family: 'Play', sans-serif;
    font-size: 16px;
    font-weight: 300px;
    padding: 5px 0;
    transition: border 0.5s;
    outline: none;
    color: black;
}
input[type=submit]
{
    border: none;
    width: 190px;
    background: white;
    color: #000;
    font-size: 16px;
    line-height: 5px;
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
                
                    <div class="signin">
                        <h1>Sign up for Serviceman.</h1>
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
                                <option value="Gardener">Gardener</option>
                                <option value="Technician">Technician</option>
                                <option value="Barber">Barber</option>
                                <option value="Carpenter">Carpenter</option>
                                <option value="Painter">Painter</option>
                                <option value="SPA">SPA</option>
                                <option value="Maids">Maids</option>                                       
                                <option value="Broker">Broker</option>                                       
                            </select>
                            <input type="text" name="aadhar" placeholder="Aadhar Number" required />
                            
                            <!-- Image Uploader -->                            
                            <p class="myForm" >Upload Profile Picture</p><input type="file" id="real-file" name="img" />                                                     
                            
                            <input type="password" name="password" placeholder="Password" required />
                            <input type="password" name="cpassword" placeholder="Retype password" required  />
                        <% flag=true;%>
                        <input type="submit" name="signup_submit" value="Sign me up" style="margin-bottom:10px;" />
                        </form>
                    
                
              
                   
                </div>        
         <% con.close();%>
    </body>
</html>