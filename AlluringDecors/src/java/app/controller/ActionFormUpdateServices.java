/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.controller;

import app.bean.Category;
import app.bean.Services;
import app.model.ServicesModel;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
public class ActionFormUpdateServices extends HttpServlet {
    private ServicesModel sm = ServicesModel.getInstance();
    HttpSession session = null;
    private Services sv = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean isMutil = ServletFileUpload.isMultipartContent(request);
            if (isMutil) {
                processUpdateServices(request, response);
            } else {
                if (request.getParameter("cmd").equals("del") == true) {
                    processDelete(request, response);
                } else {
                    
                }
            }
        } finally { 
            out.close();
        }
    }

    private void processDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String idx = request.getParameter("id");
        int id = Integer.parseInt(idx);
        session = request.getSession(true);
        boolean flag = sm.deleteObject(id);
        if (flag) {
            session.setAttribute("message", "Delete a services Successfull!");
            response.sendRedirect("admin/index.jsp?cmd=ViewServ");
        } else {
            session.setAttribute("message", "Delete a services fail, Please try again!");
            response.sendRedirect("admin/index.jsp?cmd=ViewServ");
        }
    }

    private void processUpdateServices(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List item = null;
            try {
                item = upload.parseRequest(request);
            } catch (Exception ex) {
                Logger.getLogger(ActionFormUpdateServices.class.getName()).log(Level.SEVERE, null, ex);
            }
            Iterator it = item.iterator();
            sv = new Services();
            while (it.hasNext()) {
                FileItem fi = (FileItem) it.next();
                if (fi.isFormField()) {
                    String name = fi.getFieldName();
                    String value = fi.getString();
                    if (name.equals("txtServicesName")) {
                        sv.setServicesName(value);
                    } else if (name.equals("cbbCategory")) {
                        Category cat = new Category();
                        cat.setCategoryId(Integer.parseInt(value));
                        sv.setCategory(cat);
                    } else if (name.equals("txtDescription")) {
                        sv.setDesription(value);
                    } else if (name.equals("txtPrice")) {
                        sv.setPriceServices(BigDecimal.valueOf(Double.parseDouble(value)));
                    } else if (name.equals("txtUnitServices")) {
                        sv.setUnit(value);
                    } else if (name.equals("txtDetails")) {
                        sv.setServicesDetails(value);
                    } else if (name.equals("txtID")) {
                        sv.setServicesId(Integer.parseInt(value));
                    } else if(name.equals("txtUrlOld")) {
                        sv.setImagesSmall(value);
                    }
                } else {
                    String itemName = fi.getName();
                    if(!itemName.isEmpty()) {
                        String name = getServletContext().getRealPath("/") + "images\\services\\" + itemName;
                        name = name.replace("\\build\\", "\\");
                        out.println("name:" + name);
                        sv.setImagesSmall(itemName);
                        File saveFile = new File(name);
                        fi.write(saveFile);
                    }
                }
            }
            session = request.getSession(true);
            sv.setVisiable(0);
            if (sm.updateObject(sv) == true) {
                session.setAttribute("message", "Update a services Successfull!");
                response.sendRedirect("admin/index.jsp?cmd=ViewServ");
            } else {
                session.setAttribute("message", "Update a services Fail, Please try again!");
                response.sendRedirect("admin/index.jsp?cmd=UpdateServ&id=" + sv.getServicesId());
            }/**/

        } catch (Exception ex) {
            Logger.getLogger(ActionFormUpdateServices.class.getName()).log(Level.SEVERE, null, ex);
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
