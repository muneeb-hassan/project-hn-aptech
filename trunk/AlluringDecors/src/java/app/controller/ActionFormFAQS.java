/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controller;

import app.bean.Faqs;
import app.model.FaqsModel;
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
public class ActionFormFAQS extends HttpServlet {

    HttpSession session = null;
    FaqsModel fm = FaqsModel.getInstance();
    Faqs f = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("btnCreate") != null) {
                processCreate(request, response);
            } else if (request.getParameter("btnUpdate") != null) {
                processUpdateFaqs(request, response);
            } else if (request.getParameter("cmd").equals("del") == true) {
                processDelFaqs(request, response);
            }
        } finally {
            out.close();
        }
    }

    private void processCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession(true);
        f = new Faqs();
        String question = request.getParameter("txtQuestion");
        String answer = request.getParameter("txtAnswers");
        f.setQuestion(question);
        f.setAnswer(answer);
        f.setVisiable(0);
        boolean flag = fm.insertObject(f);
        if (flag == true) {
            session.setAttribute("message", "Create Faqs successfull!");
            response.sendRedirect("admin/index.jsp?cmd=ViewFaq");
        } else {
            session.setAttribute("message", "Create Faqs fail, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=CreateFaq");
        }
    }

    private void processDelFaqs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idx = request.getParameter("id");
        session = request.getSession(true);
        boolean flag = fm.deleteObject(Integer.parseInt(idx));
        if (flag == true) {
            session.setAttribute("message", "Delete Faqs successfull!");
            response.sendRedirect("admin/index.jsp?cmd=ViewFaq");
        } else {
            session.setAttribute("message", "Delete Faqs fail, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=ViewFaq");
        }
    }

    private void processUpdateFaqs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession(true);
        f = new Faqs();
        String id = request.getParameter("txtID");
        String question = request.getParameter("txtQuestion");
        String answer = request.getParameter("txtAnswers");
        f.setFaqsid(Integer.parseInt(id));
        f.setQuestion(question);
        f.setAnswer(answer);
        f.setVisiable(0);
        boolean flag = fm.updateObject(f);
        if (flag == true) {
            session.setAttribute("message", "Update Faqs successfull!");
            response.sendRedirect("admin/index.jsp?cmd=ViewFaq");
        } else {
            session.setAttribute("message", "Update Faqs fail, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=UpdateFaqs&id=" + id);
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
