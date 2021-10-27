package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ad
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
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
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            /*???*/
            request.getSession(true).invalidate();
            /*???*/
            String regexMail = "^([a-zA-Z0-9_.\\-])+@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";
            String regex = "[a-zA-Z0-9!@#$%^&*]+";
            
            /*lay tham so tu request*/
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            
            
            
            //tao session
           HttpSession session = request.getSession(true);
            
           /*???*/
            if(!pass.matches(regex) || !user.matches(regexMail)){
                //luu session truyen toi jsp
                session.setAttribute("msg","invalid syntax");
                response.sendRedirect("login.jsp");
            }
            //lay du lieu tu web.xml
            String uid = getServletContext().getInitParameter("username");
            String pwd = getServletContext().getInitParameter("password");
            
            if (user != null && pass.equals(pwd) && user.equalsIgnoreCase(uid)){
                
                session.setAttribute("user", user);
                response.sendRedirect("admin/index.jsp");
            } else{
                session.setAttribute("error", "wrong username or password");
                response.sendRedirect("login.jsp");
                
            }
            
            
       /*???*/    
        } catch (NullPointerException e){
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } catch (Exception ex){
            response.getWriter().println(ex);
            
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
