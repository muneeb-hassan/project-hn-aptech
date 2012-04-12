/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controller;

import app.bean.Users;
import app.helper.ValidateData;
import app.model.UsersModel;
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
public class ActionFormUser extends HttpServlet {

    private HttpSession session = null;
    private UsersModel um = UsersModel.getInstance();
    private ValidateData vd = ValidateData.getInstance();
    private Users u = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("btnLogin") != null) {
                processLogin(request, response);
            } else if (request.getParameter("cmd")!=null) {
                if(request.getParameter("cmd").equals("logout") == true) {
                    session = request.getSession(true);
                    session.removeAttribute("loginx");
                    response.sendRedirect("home/index.jsp");
                } else if (request.getParameter("cmd").equals("del") == true) {
                    processDelete(request, response);
                }
            } else if (request.getParameter("btnCreate") != null) {
                processCreate(request, response);
            }
        } finally {
            out.close();
        }
    }

    private void processDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idx = request.getParameter("id");
        int id = Integer.parseInt(idx);
        boolean flag = um.deleteObject(id);
        if (flag) {

        } else {
            
        }
        response.sendRedirect("admin/index.jsp?cmd=ViewUser");
    }

    private void processLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession(true);
        String user = request.getParameter("txtUserName");
        String pass = request.getParameter("txtPassowrd");
        u = um.getUserByLogin(user, pass);
        if (u != null) {
            session.setAttribute("loginx", u);
            response.sendRedirect("home/index.jsp");
        } else {
            session.setAttribute("message", "UserName or Passowrd is wrong, Please try again!");
            response.sendRedirect("home/index.jsp?cmd=log");
        }
    }

    private void processCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("txtUserName");
        String pass = request.getParameter("txtPassword");
        String passConfirm = request.getParameter("txtPasswordConfirm");
        String fullName = request.getParameter("txtFullName");
        String address = request.getParameter("txtAddress");
        String email = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        session = request.getSession(true);
        if(user.isEmpty()) {
            session.setAttribute("message", "Error, UserName is not null!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        }else if(pass.isEmpty()) {
            session.setAttribute("message", "Error, Password is not null!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        }else if(fullName.isEmpty()) {
            session.setAttribute("message", "Error, fullName is not null!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        }else if(address.isEmpty()) {
            session.setAttribute("message", "Error, address is not null!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        }else if(phone.isEmpty()) {
            session.setAttribute("message", "Error, phone is not null!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        }else if(pass.equals(passConfirm) == false) {
            session.setAttribute("message", "Error, Password and PasswordConfrim are not the same!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        }else if(!vd.checkIsEmail(email))  {
            session.setAttribute("message", "Error, Improperly formatted email!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        }else if(!vd.checkIsPhone(phone))  {
            session.setAttribute("message", "Error, phone number you entered is malformed!");
            response.sendRedirect("home/index.jsp?cmd=reg");
        } else {
            u = new Users();
            u.setUserName(fullName);
            u.setPassowrd(pass);
            u.setFullName(fullName);
            u.setAddress(address);
            u.setEmail(email);
            u.setPhone(phone);
            u.setVisiable(0);
            if (um.insertObject(u) == true) {
                u = um.getUserByLogin(user, pass);
                session.setAttribute("loginx", u);
                response.sendRedirect("home/index.jsp");
            } else {
                session.setAttribute("message", "Register Error, Please try again!");
                response.sendRedirect("home/index.jsp?cmd=reg");
            }
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
