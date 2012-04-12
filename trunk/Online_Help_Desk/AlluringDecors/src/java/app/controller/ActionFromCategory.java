/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.controller;

import app.bean.Category;
import app.model.CategoryModel;
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
public class ActionFromCategory extends HttpServlet {
   
    private CategoryModel cm = CategoryModel.getInstance();
    private Category c = null;
    private HttpSession session = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("btnCreate") != null) {
                processCreate(request, response);
            }else if (request.getParameter("btnUpdate") != null) {
                processUpdate(request, response);
            }else if (request.getParameter("cmdx").equals("del") == true) {
                processDelete(request, response);
            }else if (request.getParameter("cmdx").equals("edit") == true) {
                processGetCategoryByID(request, response);
            }
        } finally { 
            out.close();
        }
    }

    private void processCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ctName = request.getParameter("txtCategoryName");
        session = request.getSession(true);
        if (!ctName.isEmpty()) {
            c = new Category();
            c.setCategoryName(ctName);
            c.setParentId(0);
            c.setVisiable(0);

            if (cm.insertObject(c) == true) {
                session.setAttribute("message", "Create a category successfull!");
                response.sendRedirect("admin/index.jsp?cmd=CreateCat");
            }else {
                session.setAttribute("message", "Create a category error, Please try again!");
                response.sendRedirect("admin/index.jsp?cmd=CreateCat");
            }
        }else {
            session.setAttribute("message", "Create a category error, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=CreateCat");
        }
        
    }

    private void processGetCategoryByID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        int objID = Integer.parseInt(key);
        
    }

    private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catName = request.getParameter("txtCategoryName");
        String idx = request.getParameter("txtID");
        session = request.getSession(true);
        if (!catName.isEmpty()) {
            Category cat = new Category();
            cat.setCategoryId(Integer.parseInt(idx));
            cat.setCategoryName(catName);
            if (cm.updateObject(cat)) {
                response.sendRedirect("admin/index.jsp?cmd=ViewCat");
            } else {
                session.setAttribute("message", "Error: Update category fail!");
                response.sendRedirect("admin/index.jsp?cmd=UpdateCat&id=" + idx);
            }
        } else {
            session.setAttribute("message", "Error: Category Name is not empty!");
            response.sendRedirect("admin/index.jsp?cmd=UpdateCat&id=" + idx);
        }
    }

    private void processDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        if(!key.isEmpty()) {
            int objID = Integer.parseInt(key);
            session = request.getSession(true);
            if (cm.deleteObject(objID) == true) {
                session.setAttribute("message", "Delete a Category successfull!");
            }else {
                session.setAttribute("message", "Delete a Category Error, Please try again!");
            }
            response.sendRedirect("admin/index.jsp?cmd=ViewCat");
        } else {
            session.setAttribute("message", "Delete a Category Error, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=ViewCat");
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
