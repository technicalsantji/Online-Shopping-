/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.Servlet;

import Com.Entity.User;
import Com.Helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SANT JI
 */
public class AddressOtherDetailsForBill extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            HttpSession s=request.getSession();
            
           User user=(User) s.getAttribute("currentuser");
          out.print(user.getUemail());
         
           String Addres=request.getParameter("address");
             String city=request.getParameter("city");
               String state=request.getParameter("state");
                 String country=request.getParameter("country");
                   String payment=request.getParameter("payment");
                     String taxid=request.getParameter("taxid");
                       String phone=request.getParameter("phone");
           
                        String status="bill";
            out.print(taxid);
            try {
                Connection con=ConnectionProvider.getConnection();
                PreparedStatement ps=con.prepareStatement("update user set address=?,city=?,state=?,country=?,uphone=? where uemail=?");
                ps.setString(1, Addres);
                  ps.setString(2, city);
                    ps.setString(3, state);
                      ps.setString(4, country);
                      ps.setString(5, phone);
                        ps.setString(6, user.getUemail());
                        ps.executeUpdate();
                        
             PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileno=?,orderdate=now(),deliverydate=DATE_ADD(orderdate,INTERVAL 7 DAY),paymentmethod=?,transactionid=?,status=? where email=? and address is Null ");
             ps1.setString(1, Addres);
             ps1.setString(2, city);
             ps1.setString(3, state);
             ps1.setString(4, country);
             ps1.setString(5, phone);
             ps1.setString(6, payment);
             ps1.setString(7, taxid);
             ps1.setString(8, status);
             ps1.setString(9, user.getUemail());
            ps1.executeUpdate();
            response.sendRedirect("bill.jsp");
            
            } catch (Exception e) {
            }
           
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
