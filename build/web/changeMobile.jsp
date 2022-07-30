<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Entity.User"%>
<%
   User user=(User)session.getAttribute("currentuser");
   String phone=request.getParameter("phone");
   String password=request.getParameter("password");
int a=1;   
try {
        Connection con=ConnectionProvider.getConnection();
        PreparedStatement ps=con.prepareStatement("select * from user where uemail=? and upassword=?");
        ps.setString(1, user.getUemail());
        ps.setString(2, password);
        ResultSet rs=ps.executeQuery();
        while (rs.next()) {  
            
                a=2;
            PreparedStatement  ps2=con.prepareStatement("update user set uphone=? where uemail=?");
            ps2.setString(1, phone);
            ps2.setString(2, user.getUemail());
            ps2.executeUpdate();
            response.sendRedirect("changeMobileNumber.jsp?msg=done");
            }
        if(a==1){
            response.sendRedirect("changeMobileNumber.jsp?msg=invalid");
        }
        
    } catch (Exception e) {
    }
   
   

%>
