<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="Com.Entity.User"%>
<%

User user=(User)session.getAttribute("currentuser");
String Address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
try {
        Connection con=ConnectionProvider.getConnection();
        PreparedStatement ps=con.prepareStatement("update user set address=?,city=?,state=?,country=? where uemail=?");
        ps.setString(1, Address);
         ps.setString(2, city);
          ps.setString(3, state);
           ps.setString(4, country);
            ps.setString(5, user.getUemail());
            ps.executeUpdate();
            response.sendRedirect("addChangeAddress.jsp?msg=done");
    } catch (Exception e) {
         response.sendRedirect("addChangeAddress.jsp?msg=wrong");
    }
%>