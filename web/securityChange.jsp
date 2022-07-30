<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="Com.Entity.User"%>
<%
String question=request.getParameter("sequrity");
String answer=request.getParameter("answer");
String password=request.getParameter("password");

User user=(User)session.getAttribute("currentuser");
 int a=1;
try {
   
        Connection con=ConnectionProvider.getConnection();
        PreparedStatement ps=con.prepareStatement("select * from user where uemail=? and upassword=?");
        ps.setString(1, user.getUemail());
        ps.setString(2, password);
        ResultSet rs=ps.executeQuery();
        while (rs.next()) {    
                 a=2;
                 PreparedStatement s=con.prepareStatement("update user set uquestion=?,uanswer=? where uemail=?");
                 s.setString(1, question);
                 s.setString(2, answer);
                 s.setString(3, user.getUemail());
                 s.executeUpdate();
                
                
            }
        if(a==2){
            response.sendRedirect("changeSecurityQuestion.jsp?msg=done"); 
        }
        if(a==1){
            response.sendRedirect("changeSecurityQuestion.jsp?msg=invalid");
        }
    } catch (Exception e) {
         response.sendRedirect("changeSecurityQuestion.jsp?msg=exe");
    }

%>