<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="Com.Entity.User"%>
<% 
User user =(User)session.getAttribute("currentuser");
String status="processing";

try {
        Connection con=ConnectionProvider.getConnection();
        PreparedStatement ps=con.prepareStatement("update cart set status=? where email=? and status='bill'");
        ps.setString(1, status);
        ps.setString(2, user.getUemail());
       ps.executeUpdate();
       response.sendRedirect("home.jsp");
    } catch (Exception e) {
        out.print(e);
    }

%>