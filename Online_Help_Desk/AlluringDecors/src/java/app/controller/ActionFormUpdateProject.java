/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.controller;

import app.bean.Project;
import app.model.ProjectModel;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
public class ActionFormUpdateProject extends HttpServlet {
   
    HttpSession session = null;
    ProjectModel pm = ProjectModel.getInstance();
    Project p = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean isMutil = ServletFileUpload.isMultipartContent(request);
            if (isMutil) {
                processUpdate(request, response);
            }
        } finally { 
            out.close();
        }
    }

    private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List item = null;
        try {
            item = upload.parseRequest(request);
        } catch (Exception ex) {
            Logger.getLogger(ActionFormUpdateProject.class.getName()).log(Level.SEVERE, null, ex);
        }
        Iterator it = item.iterator();
        p = new Project();
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date date = null;
        while (it.hasNext()) {
            FileItem fi = (FileItem) it.next();
            if (fi.isFormField()) {
                String name = fi.getFieldName();
                String value = fi.getString();
                if (name.equals("txtName")) {
                    p.setProjectName(value);
                } else if(name.equals("txtID")) {
                    p.setProjectId(Integer.parseInt(value));
                } else if(name.equals("txtUrlOld")) {
                    p.setImages(value);
                } else if (name.equals("txtStartDate")) {
                    try {
                        date = df.parse(value);
                        p.setStartDate(new java.sql.Date(date.getTime()));
                    } catch (ParseException ex) {
                        Logger.getLogger(ActionFormProjects.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }else if (name.equals("txtEndDate")) {
                    try {
                        date = df.parse(value);
                        p.setEndDate(new java.sql.Date(date.getTime()));
                    } catch (ParseException ex) {
                        Logger.getLogger(ActionFormProjects.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else if(name.equals("cbbStatus")){
                    p.setStatusProject(Integer.parseInt(value));
                } else if(name.equals("txtDescription")){
                    p.setDescription(value);
                } else if (name.equals("txtDetails")) {
                    p.setDetails(value);
                }
            } else {
                try {
                    String itemName = fi.getName();
                    if(!item.isEmpty()) {
                        String name = getServletContext().getRealPath("/") + "images\\services\\" + itemName;
                        name = name.replace("\\build\\", "\\");
                        p.setImages(itemName);
                        File saveFile = new File(name);
                        fi.write(saveFile);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(ActionFormProjects.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        session = request.getSession(true);
        p.setVisiable(0);
        if (pm.updateObject(p)) {
            session.setAttribute("message", "Update a Project Successfull!");
            response.sendRedirect("admin/index.jsp?cmd=ViewProject");
        } else {
            session.setAttribute("message", "Update a Project fail, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=UpdateProject&id=" + p.getProjectId());
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
