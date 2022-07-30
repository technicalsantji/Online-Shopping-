<%@page import="java.sql.ResultSet"%>
<%@page import="Com.Entity.User"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<% 
    User user=(User)session.getAttribute("currentuser");
String oldpassword=request.getParameter("oldpassword");
String npassword=request.getParameter("npassword");
String cpassword=request.getParameter("cpassword");
if(!cpassword.equals(npassword)){
    response.sendRedirect("changePassword.jsp?msg=nomatch");
}else{
    int check=0;
    try {
            Connection con=ConnectionProvider.getConnection();
             PreparedStatement s=con.prepareStatement("select * from user where uemail=? and upassword=?");
             s.setString(1, user.getUemail());
             s.setString(2, oldpassword);
          ResultSet  rs=   s.executeQuery();
          while (rs.next()) {
                check=1;
                  PreparedStatement s1=con.prepareStatement("update user set upassword=? where uemail=? and upassword=?");
                  s1.setString(1, npassword);
                  s1.setString(2, user.getUemail());
                  s1.setString(3, oldpassword);
                  s1.executeUpdate();
                  response.sendRedirect("changePassword.jsp?msg=success");
              }
          if(check==0){
              response.sendRedirect("changePassword.jsp?msg=wrong");
          }
        } catch (Exception e) {
            
        }
}


%>