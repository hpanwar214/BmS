/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mypackage;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class DatabaseClass {
   private Connection con;
   
  public DatabaseClass()
  {
      Connect();
    
  }
  
  public void Connect()
  {
      try
      {
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportaljsp","root","");
      }
      catch(Exception ex)
      {
          System.out.println(ex.getMessage());
      }
  }
  
 public boolean loginValidate(String adminname , String password) throws SQLException 
 {
    
     String sql = "select * from admin where adminname=? and password=?";
     PreparedStatement pstm = con.prepareStatement(sql);
     pstm.setString(1,adminname);
     pstm.setString(2,password);
    ResultSet rs =  pstm.executeQuery();
    int i = 0;
    while(rs.next())
    {
      i++;  
    }
    if(i==1)
    {
        return true;
    }
    else
    {
        return false;
    }
    
 }
 
 
 
  public boolean loginValidateUser(String emailid , String password) throws SQLException 
 {
    
     String sql = "select * from siteuser where emailid=? and password=?";
     PreparedStatement pstm = con.prepareStatement(sql);
     pstm.setString(1,emailid);
     pstm.setString(2,password);
    ResultSet rs =  pstm.executeQuery();
    int i = 0;
    while(rs.next())
    {
      i++;  
    }
    if(i==1)
    {
        return true;
    }
    else
    {
        return false;
    }
    
 }
 
  
  public boolean loginValidateRecruiter(String emailid , String password) throws SQLException 
 {
    
     String sql = "select * from recruiter where emailid=? and password=? and status=?";
     PreparedStatement pstm = con.prepareStatement(sql);
     pstm.setString(1,emailid);
     pstm.setString(2,password);
     pstm.setString(3,"Accept");
    ResultSet rs =  pstm.executeQuery();
    int i = 0;
    while(rs.next())
    {
      i++;  
    }
    if(i==1)
    {
        return true;
    }
    else
    {
        return false;
    }
    
 }
 
  
  
 
 
 
 
 public void addNewUser(String firstname,String lastname,String emailid,String password,String gender,String contactno)
 {
    try
    {
        String sql = "insert into siteuser values(?,?,?,?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,firstname);
         pstm.setString(2,lastname);
          pstm.setString(3,emailid);
           pstm.setString(4,password);
            pstm.setString(5,gender);
             pstm.setString(6,contactno);
             pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
 } 
 public void addNewRecruiter(String companyname,String firstname,String lastname,String emailid,String password,String gender,String contactno)
 {
    try
    {
        String sql = "insert into recruiter values(?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,companyname);
        pstm.setString(2,firstname);
         pstm.setString(3,lastname);
          pstm.setString(4,emailid);
           pstm.setString(5,password);
            pstm.setString(6,gender);
             pstm.setString(7,contactno);
              pstm.setString(8,"Pending");
             pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
    
    
    
 }
 
 
 public ResultSet newRequest()
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from recruiter where status='Pending'");
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
  
  
 
 public void updatestatus(String emailid,String status)
 {
    try
    {
        String sql = "update recruiter set status=? where emailid=?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,status);
        pstm.setString(2,emailid);
         
             pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
 }
 
 
 public ResultSet viewallrecruiter()
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from recruiter");
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
 
 
 public ResultSet viewalluser()
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from siteuser");
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
 
 

 
 
 public void deleteRecruiter(String emailid)
 {
    try
    {
        String sql = "delete from recruiter where emailid=?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,emailid);
        
             pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
 }
 
 
 public void deleteUser(String emailid)
 {
    try
    {
        String sql = "delete from siteuser where emailid=?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,emailid);
        
             pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
 }
 
 
  public void deletejobpost(String id)
 {
    try
    {
        String sql = "delete from job where id=?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,id);
        
             pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
 }
 
 
 
 
 
 
 
 
 
 
 public void addJob(String company,String jobtitle,String postdate,String lastdate,String jobdesc,String location)
 {
    try
    {
        String sql = "insert into job(company,jobtitle,postdate,lastdate,jobdesc,location) values(?,?,?,?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,company);
         pstm.setString(2,jobtitle);
          pstm.setString(3,postdate);
           pstm.setString(4,lastdate);
            pstm.setString(5,jobdesc);
             pstm.setString(6,location);
             pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
 } 
 
 
 public ResultSet viewjobpost(String companyname)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from job where company=?");
        pstm.setString(1, companyname);
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
 
 
 public ResultSet viewalljob(String date)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from job where lastdate>=?");
        pstm.setString(1, date);
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
 
 
 
 
 
 
 
 
 
 public String getCompanyName(String emailid)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    String companyname ="";
    try
    {
        pstm = con.prepareStatement("select * from recruiter where emailid=?");
        pstm.setString(1, emailid);
        rs = pstm.executeQuery();
       
        while(rs.next())
        {
       companyname =  rs.getString("companyname");
        }
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return companyname;
 }
 
 
 public String userName(String emailid)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    String name ="";
    try
    {
        pstm = con.prepareStatement("select * from siteuser where emailid=?");
        pstm.setString(1, emailid);
        rs = pstm.executeQuery();
       
        while(rs.next())
        {
       name =  rs.getString("firstname") + " " + rs.getString("lastname");
        }
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return name;
 }
 
 
  public String recruiterName(String emailid)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    String name ="";
    try
    {
        pstm = con.prepareStatement("select * from recruiter where emailid=?");
        pstm.setString(1, emailid);
        rs = pstm.executeQuery();
       
        while(rs.next())
        {
       name =  rs.getString("firstname") + " " + rs.getString("lastname");
        }
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return name;
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 public void applyjob(String userid,String jobid,String applydate)
 {
    try
    {
        String sql = "insert into apply(userid,jobid,applydate) values(?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,userid);
         pstm.setString(2,jobid);
          pstm.setString(3,applydate);
        pstm.executeUpdate();
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
 
 } 
 
 
 
 
 
 public boolean applyornot(String userid , String jobid) throws SQLException 
 {
    
     String sql = "select * from apply where userid=? and jobid=?";
     PreparedStatement pstm = con.prepareStatement(sql);
     pstm.setString(1,userid);
     pstm.setString(2,jobid);
    ResultSet rs =  pstm.executeQuery();
    int i = 0;
    while(rs.next())
    {
      i++;  
    }
    if(i==1)
    {
        return true;
    }
    else
    {
        return false;
    }
    
 }
 
 
 
 public ResultSet applyjoblist(String company)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from apply where company=?");
        pstm.setString(1, company);
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
 
 
 
 public ResultSet viewuserdetail(String emailid)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from siteuser where emailid=?");
        pstm.setString(1, emailid);
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
 
 
 
 public ResultSet viewjobdetail(String id)
 {
    PreparedStatement pstm;
    ResultSet rs=null;
    try
    {
        pstm = con.prepareStatement("select * from job where id=?");
        pstm.setString(1, id);
        rs = pstm.executeQuery();
        
    }
    catch(Exception ex)
    {
        System.out.println(ex.getMessage());
    }
    return rs;
 }
 
 
 
  public ResultSet userProfile(String emailid)
   {
   PreparedStatement pstm;
   ResultSet rs = null;
   try {
            pstm = con.prepareStatement("Select * from siteuser where emailid=?");
            pstm.setString(1,emailid);
            rs=pstm.executeQuery();
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
   
   
      return rs; 
   }
  
  
  public ResultSet recruiterProfile(String emailid)
   {
   PreparedStatement pstm;
   ResultSet rs = null;
   try {
            pstm = con.prepareStatement("Select * from recruiter where emailid=?");
            pstm.setString(1,emailid);
            rs=pstm.executeQuery();
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            
        }
   
   
      return rs; 
   }
    
 
 
  
  public void editProfile(String firstname,String lastname,String emailid,String password,String gender,String contactno)
           {
        try {
            String sql="update siteuser set firstname=?,lastname=?,password=?,gender=?,contactno=? where emailid=?";
            
            PreparedStatement pstm=con.prepareStatement(sql);
            pstm.setString(1,firstname);
             pstm.setString(2,lastname);
            pstm.setString(3,password);
         pstm.setString(4,gender);
             pstm.setString(5,contactno);
             pstm.setString(6,emailid);
         pstm.executeUpdate();
         
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  
  
  
           
  public void editrecProfile(String companyname , String firstname,String lastname,String emailid,String password,String gender,String contactno)
           {
        try {
            String sql="update recruiter set companyname=?,firstname=?,lastname=?,password=?,gender=?,contactno=? where emailid=?";
            
            PreparedStatement pstm=con.prepareStatement(sql);
             pstm.setString(1,companyname);
            pstm.setString(2,firstname);
             pstm.setString(3,lastname);
            pstm.setString(4,password);
         pstm.setString(5,gender);
             pstm.setString(6,contactno);
             pstm.setString(7,emailid);
         pstm.executeUpdate();
         
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  
 
 
 
  public int totaljobs() throws SQLException 
 {
    
     String sql = "select * from job";
     PreparedStatement pstm = con.prepareStatement(sql);

    ResultSet rs =  pstm.executeQuery();
    int i = 0;
    while(rs.next())
    {
      i++;  
    }
    
        return i; 
 }
  
  
  public int totalrecruiter() throws SQLException 
 {
    
     String sql = "select * from recruiter";
     PreparedStatement pstm = con.prepareStatement(sql);

    ResultSet rs =  pstm.executeQuery();
    int i = 0;
    while(rs.next())
    {
      i++;  
    }
    
        return i;  
 }
  
 
  public int totalusers() throws SQLException 
 {
    
     String sql = "select * from siteuser";
     PreparedStatement pstm = con.prepareStatement(sql);

    ResultSet rs =  pstm.executeQuery();
    int i = 0;
    while(rs.next())
    {
      i++;  
    }
    
        return i;  
 }
  
 
}
