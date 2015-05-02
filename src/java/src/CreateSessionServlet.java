/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import bean.ComplaintData;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kanu
 */
@WebServlet(name = "CreateSessionServlet", urlPatterns = {"/CreateSessionServlet"})
public class CreateSessionServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<ComplaintData> ids=new ArrayList<ComplaintData>();
        ComplaintData c1=new ComplaintData("1234");
        ComplaintData c2=new ComplaintData("5678");
        ids.add(c1);
        ids.add(c2);
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session=request.getSession();  
        session.setAttribute("userName",request.getParameter("name"));  
        String id1=(String)session.getAttribute("userName");
        if(id1==null)
        {
            response.sendRedirect("index.jsp");
        }
        //request.setAttribute(userName, userName);
        request.setAttribute("ids", ids);
        request.getRequestDispatcher("welcomeStruts.jsp").forward(request, response);
        
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
