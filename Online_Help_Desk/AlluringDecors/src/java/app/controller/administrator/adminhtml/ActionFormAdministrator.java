/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.controller.administrator.adminhtml;

import app.bean.Administrator;
import app.model.AdministratorModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ActionFormAdministrator extends HttpServlet {
    private AdministratorModel am = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        am = AdministratorModel.getInstance();
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("btnLogin") != null) {
                processLogin(request, response);
            }else if(request.getParameter("btnAdd") != null) {
                processCreateNew(request, response);
            }else if (request.getParameter("btnUpdate") != null) {
                processUpdate(request, response);
            }else if (request.getParameter("cmdx").equals("del") == true) {
                processDelete(request, response);
            }else if (request.getParameter("cmdx").equals("edit") == true) {

            }else if (request.getParameter("btnSearch") != null) {
                out.println("Click btnSearch");
            }
        } finally { 
            out.close();
        }
    }

    private void processLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Administrator admin = new Administrator();
            String userName = request.getParameter("txtUserName");
            String password = request.getParameter("txtPassword");
            admin.setUserName(userName);
            admin.setPassword(password);
            HttpSession session = request.getSession(true);
            Administrator ad = am.getAdministrator(admin);
           if (ad != null) {
                session.setAttribute("login", ad);
                response.sendRedirect("admin/index.jsp");
            }else {
                session.setAttribute("message", "Username or password is wrong, Please login again!");
                response.sendRedirect("admin/login.jsp");
            }
    }
    
    private void processCreateNew(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        Administrator admin = new Administrator();
        String userName = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");
        String FullName = request.getParameter("txtFullName");
        String address = request.getParameter("txtAddress");
        String phone = request.getParameter("txtPhone");
        String email = request.getParameter("txtEmail");
        String role = request.getParameter("cbbRoles");
        admin.setUserName(userName);
        admin.setPassword(password);
        admin.setFullName(FullName);
        admin.setPhone(phone);
        admin.setAddress(address);
        admin.setEmail(email);
        admin.setRoles(Integer.parseInt(role));
        admin.setVisiable(0);
        if (am.insertObject(admin) == true) {
            try {
                session.setAttribute("message", "Create new administrator successfull!");
                response.sendRedirect("admin/index.jsp?cmd=ViewAdmin");
            } catch (IOException ex) {
                Logger.getLogger(ActionFormAdministrator.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else {
            try {
                session.setAttribute("message", "Create new administrator fail!");
                response.sendRedirect("admin/index.jsp?cmd=CreateAdmin");
            }catch (IOException ex) {
                Logger.getLogger(ActionFormAdministrator.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void processDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        int objID = Integer.parseInt(key);
        HttpSession session = request.getSession(true);
        if (am.deleteObject(objID)==true) {
            session.setAttribute("message", "Delete administrator successfull!");
            response.sendRedirect("admin/index.jsp?cmd=ViewAdmin");
        }else {
            session.setAttribute("message", "Delete administator fail, Please try again");
            response.sendRedirect("admin/index.jsp?cmd=ViewAdmin");
        }
    }

    private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Administrator admin = new Administrator();
        String aID = request.getParameter("txtID");
        String userName = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");
        String FullName = request.getParameter("txtFullName");
        String address = request.getParameter("txtAddress");
        String phone = request.getParameter("txtPhone");
        String email = request.getParameter("txtEmail");
        String role = request.getParameter("cbbRoles");
        admin.setAdministratorId(Integer.parseInt(aID));
        admin.setUserName(userName);
        admin.setPassword(password);
        admin.setFullName(FullName);
        admin.setPhone(phone);
        admin.setAddress(address);
        admin.setEmail(email);
        admin.setRoles(Integer.parseInt(role));
        admin.setVisiable(0);
        HttpSession session = request.getSession(true);
        if (am.updateObject(admin) == true) {
            session.setAttribute("message", "Update information successfull!");
            response.sendRedirect("admin/index.jsp?cmd=ViewAdmin");
        }else {
            session.setAttribute("message", "Update infomation fail, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=UpdateAdmin&id=" + aID);
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
