/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controller;

import app.bean.ContactUs;
import app.model.ContactUsModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ActionFormAboutUS extends HttpServlet {

    HttpSession session = null;
    ContactUsModel cm = ContactUsModel.getInstance();
    ContactUs c = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("btnCreate") != null) {
                processCreate(request, response);
            }
        } finally {
            out.close();
        }
    }

    private void processCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("txtContent");
        String idx = request.getParameter("id");
        session = request.getSession(true);
        if (idx.isEmpty()) {
            c = new ContactUs();
            c.setContents(content);
            c.setVisiable(0);
            boolean flag = cm.insertObject(c);
            if (flag == true) {
                 session.setAttribute("message", "Create AboutUS Successfull!");
            } else {
                session.setAttribute("message", "Create AboutUS Fail, Please try again!");
               
            }
        } else {
            int id = Integer.parseInt(idx);
            c = new ContactUs();
            c.setContactId(id);
            c.setContents(content);
            c.setVisiable(0);
            boolean flag = cm.updateObject(c);
            if (flag) {
                session.setAttribute("message", "Update AboutUS Successfull!");
            } else {
                session.setAttribute("message", "Update AboutUS Fail, Please try again!");
            }
        }
        response.sendRedirect("admin/index.jsp?cmd=ViewContact");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
