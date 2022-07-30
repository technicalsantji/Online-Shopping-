<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%
int a=1;
String id=request.getParameter("id");
int pid=Integer.parseInt(id);
String email=request.getParameter("email");
String cancel="cancel";
try {
    
        Connection con=ConnectionProvider.getConnection();
        PreparedStatement ps=con.prepareStatement("update cart set status=? where email=? and pid=? and status='processing' ");
        ps.setString(1, cancel);
        ps.setString(2, email);
        ps.setInt(3, pid);
        ps.executeUpdate();
        a=2;
        response.sendRedirect("ordersReceived.jsp?msg=cancel");
        if(a==1){
              response.sendRedirect("ordersReceived.jsp?msg=went");
        }
       
    } catch (Exception e) {
    }


%>