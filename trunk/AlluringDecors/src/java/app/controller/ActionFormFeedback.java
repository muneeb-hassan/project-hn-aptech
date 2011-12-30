/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.controller;

import app.bean.Feedback;
import app.model.FeedbackModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ActionFormFeedback extends HttpServlet {
    HttpSession session = null;
    FeedbackModel fbm = FeedbackModel.getInstance();
    Feedback fb = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("btnCreate") != null) {
                processCreate(request, response);
            } else if (request.getParameter("cmd").equals("realy") == true) {
                processRealyFeedback(request, response);
            } else if (request.getParameter("cmd").equals("del") == true) {
                processDelete(request, response);
            }
        } finally { 
            out.close();
        }
    }

    private void processCreate(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        fb = new Feedback();
        String fullName = request.getParameter("txtFullName");
        String email = request.getParameter("txtEmail");
        String title = request.getParameter("txtTitle");
        String content = request.getParameter("txtContent");
        fb.setFullName(fullName);
        fb.setEmail(email);
        fb.setTitle(title);
        fb.setBody(content);
        Date d = new Date();
        fb.setCreateDate(d);
        fb.setVisiable(0);
        boolean flag = fbm.insertObject(fb);
        session = request.getSession(true);
        if (flag == true) {
            session.setAttribute("message", "Your feedback has been sent to the administrator");
        }else {
            session.setAttribute("message", "Send feedback fail, Please try again!");
        }
        response.sendRedirect("home/index.jsp?cmd=feedback");
    }

    private void processDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String idx = request.getParameter("id");
        session = request.getSession(true);
        if (!idx.isEmpty()) {
            int id = Integer.parseInt(idx);
            boolean flag = fbm.deleteObject(id);
            if (flag) {
                session.setAttribute("message", "Delete Feedback Successfull!");
            }else {
                session.setAttribute("message", "Delete Feedback Fail, Please try again!");
            }
        } else {
            session.setAttribute("message", "Delete Feedback Fail, Please try again!");
        }
         response.sendRedirect("admin/index.jsp?cmd=ViewFeedback");
    }

    private void processRealyFeedback(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String idx = request.getParameter("id");
        session = request.getSession(true);
        if (!idx.isEmpty()) {
            int id = Integer.parseInt(idx);
            boolean flag = fbm.realyFeedback(id);
            if (flag) {
                session.setAttribute("message", "Realy Feedback Successfull!");
                response.sendRedirect("admin/index.jsp?cmd=ViewFeedback");
            }else {
                session.setAttribute("message", "Realy Feedback Fail, Please try again!");
                response.sendRedirect("admin/index.jsp?cmd=FeedbackDetails&id=" + id);
            }
        } else {
            session.setAttribute("message", "Realy Feedback Fail, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=ViewFeedback");
        }
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
