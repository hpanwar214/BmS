<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.*"%>
<%@page import="generateOtp.SmsOtp" %> 
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@include file="connection.jsp" %>
<%
    boolean gen_otp=false;
    int otp=0;
    String mobile=(String)request.getParameter("mobile");
    
    Connection con=null;
    Statement statement=null;
    try
    {
        con=DriverManager.getConnection(url);
        statement=con.createStatement();
        String sql="SELECT MOBILE FROM USERS WHERE MOBILE='"+mobile+"'" ;  
        ResultSet rs_1= statement.executeQuery(sql);
        if(rs_1!=null)
        {
            %>
            <script>alert("Mobile Number already registered. Try New Mobile No.")</script>
            <%
        }
        else
        {
            if(mobile!=null&&!gen_otp)
            {
                SmsOtp sms=new SmsOtp();
                session.setAttribute("mobile",mobile);
                otp = sms.sendSms(mobile);
                session.setAttribute("otp",otp);
                gen_otp=true;
                System.out.print(otp+"  otp");
            }
            System.out.print(mobile+" mobile");       
        }
        
    }
    catch(Exception e)
    {
        System.out.print(e);
    }
%>
<html>
    <head>
        <script type="text/javascript">
            function validate() 
            {             
             var phone=/^\d{10}$/;
              if(!document.myForm.mobile.value.match(phone))
              {
                alert("Mobile No. Incorrect");
                document.myForm.mobile.focus() ;
                return false;
              }
              else
              {
                  alert("OTP generated. Verify it in 120 seconds")
                  return true;
              }
              
            }
            function verify_otp()
            {
                var urotp=document.getElementById('otp').value;
                if(!urotp)
                {
                    alert("Please Enter OTP")
                    document.getElementById('otp').focus;
                    return false;
                }
                var otp=<%=otp%>;
               
               if(urotp==otp)
                {
                    alert("Mobile no. verified. Please fill out these detail for signup");
                    window.location="signup.jsp?mobile="+<%=mobile%>;
                    return true;
                }
                else if(urotp!=otp)
                {
                    alert(urotp+" is Invalid OTP");
                    document.getElementById('otp').focus();
                    return false;                    
                }
            }
        </script>
        <title>Contact Number</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="sigStyle.css">
        
    <style>


body
{
    font-family: Tahoma, Geneva, sans-serif;
    color: #fff;
    background: url("myimages/back1.jpg"); 
    background-size: cover;
}
.contact
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
    width: 230px;
    background: white;
    color: #000;
    font-size: 16px;
    line-height: 37px;
    padding: 1px 0;
    border-radius: 15px;
    cursor: pointer;
}
input[type=submit]:hover
{
    color: #fff;
    background-color: black;
}
button
{
    border: none;
    width: 230px;
    background: white;
    color: #000;
    font-size: 16px;
    line-height: 37px;
    padding: 1px 0;
    border-radius: 15px;
    cursor: pointer;
}
button:hover
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
           
            .back{
                background: #5cb3fd;
                position: relative;
                margin-top:50px;
                height: 800px;
                width: 100%;;
                
                float: left;
            }
            div.jumbotron{
                width : 100%;
                height: 600px;
                margin-top: 100px;
            }
        </style>
    </head>
    <body>
       
       
        <div class="contact">
            
         
                
              
                        <h1>Sign up</h1>
                        <form name="myForm" onsubmit="return validate();" method="POST" action="contact.jsp">
                            <input type="text" name="mobile" placeholder="Enter Contact number" required  />
                        <input type="submit" name="gen_otp" value="Generate OTP"  />
                        
                        </form>
                        <br><br><br><br>
                        
                <hr>    
                <hr>
                
                        <h3>OTP Verification</h3>
                        <input type="text" name="otp" id="otp" placeholder="Type OTP" required  />
                        <button  name="verfiy_otp" onclick="return verify_otp();">Verify OTP</button>
                
              
          
            
<% con.close();%>
        </div>
         
    </body>
</html>