<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Com.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="Com.Entity.User"%>
<% 
User user=(User)session.getAttribute("currentuser");
String cid=request.getParameter("id");
    int pid=Integer.parseInt(cid);
    String insdec=request.getParameter("quantity");
    int price=0;
    int total=0;
    int quantity=0;
    int ftotl=0;
    try {
            Connection con=ConnectionProvider.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from cart where email=? and pid=?");
            ps.setString(1, user.getUemail());
            ps.setInt(2, pid);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) { 
                price=rs.getInt(4);
                total=rs.getInt(5);
                quantity=rs.getInt(3);
                    
                }
            if(quantity==1 && insdec.equals("dec")){
                response.sendRedirect("myCart.jsp?msg=no");
            } 
            else if(quantity!=1 && insdec.equals("dec")){
                
           total=total-price;
           quantity=quantity-1;
           PreparedStatement ps1=con.prepareStatement("update cart set total=?,quantity=? where email=? and pid=?");
           ps1.setInt(1,total);
           ps1.setInt(2, quantity);
           ps1.setString(3, user.getUemail());
           ps1.setInt(4, pid);
           ps1.executeUpdate();
           response.sendRedirect("myCart.jsp?msg=dec");
           
         }
            else {
           total=total+price;
           quantity=quantity+1;
           PreparedStatement ps1=con.prepareStatement("update cart set total=?,quantity=? where email=? and pid=?");
           ps1.setInt(1,total);
           ps1.setInt(2, quantity);
           ps1.setString(3, user.getUemail());
           ps1.setInt(4, pid);
           ps1.executeUpdate();
           response.sendRedirect("myCart.jsp?msg=inc");
            }
          
        } catch (Exception e) {
        }

%>