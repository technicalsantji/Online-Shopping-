<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Entity.User"%>
<% 
User user=(User)session.getAttribute("currentuser");
String p=request.getParameter("id");
int pid=Integer.parseInt(p);
try {
        Connection con=ConnectionProvider.getConnection();
        PreparedStatement ps=con.prepareStatement("delete from cart where email=? and pid=?");
        ps.setString(1, user.getUemail());
        ps.setInt(2, pid);
        ps.executeUpdate();
        response.sendRedirect("myCart.jsp?msg=rem");
    } catch (Exception e) {
    }

%>