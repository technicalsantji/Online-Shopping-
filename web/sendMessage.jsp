<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="Com.Entity.User"%>
<%
    User user = (User) session.getAttribute("currentuser");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");
    int a = 1;
    try {
        Connection con = ConnectionProvider.getConnection();
        PreparedStatement ps = con.prepareStatement("insert into message(uid,uemail,umobile,usubject,umessage) values(?,?,?,?,?)");
        ps.setInt(1, user.getUid());
        ps.setString(2, user.getUemail());
        ps.setString(3, user.getUphone());
        ps.setString(4, subject);
        ps.setString(5, message);
        ps.executeUpdate();

        a = 2;
        response.sendRedirect("messageUs.jsp?msg=done");

        if (a == 1) {
            response.sendRedirect("messageUs.jsp?msg=invalid");
        }
    } catch (Exception e) {
        response.sendRedirect("messageUs.jsp?msg=" + e + "");
    }


%>