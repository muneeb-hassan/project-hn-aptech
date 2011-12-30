/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controller;

import app.bean.Category;
import app.bean.Services;
import app.helper.ValidateData;
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
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
public class ActionFormServices extends HttpServlet {

    private ServicesModel sm = ServicesModel.getInstance();
    private ValidateData vd = ValidateData.getInstance();
    HttpSession session = null;
    private Services sv = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean isMutil = ServletFileUpload.isMultipartContent(request);
            if (isMutil) {
                processCreate(request, response);
            } else {
                if (request.getParameter("btnSearch") != null) {
                    processSearch(request, response);
                } else {
                    processSearchClient(request, response);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(ActionFormServices.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    private void processSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("txtProductName");
        String catx = request.getParameter("cbbCategory");
        int catId = Integer.parseInt(catx);
        List<Services> lServ = sm.searchObjectByName(name, catId);
        session = request.getSession(true);
        session.setAttribute("lServx", lServ);
        response.sendRedirect("admin/index.jsp?cmd=ViewSearch");
    }

    private void processSearchClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("txtProductName");
        String catx = request.getParameter("cbbCategory");
        int catId = Integer.parseInt(catx);
        List<Services> lServ = sm.searchObjectByName(name, catId);
        session = request.getSession(true);
        session.setAttribute("lServx", lServ);
        response.sendRedirect("home/index.jsp?cmd=ViewSearch");
    }

    private void processCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            session = request.getSession(true);
            List item = null;
            try {
                item = upload.parseRequest(request);
            } catch (Exception ex) {
                Logger.getLogger(ActionFormServices.class.getName()).log(Level.SEVERE, null, ex);
            }
            Iterator it = item.iterator();
            sv = new Services();
            while (it.hasNext()) {
                FileItem fi = (FileItem) it.next();
                if (fi.isFormField()) {
                    String name = fi.getFieldName();
                    String value = fi.getString();
                    if (name.equals("txtServicesName")) {
                        if(!value.isEmpty()) {
                            sv.setServicesName(value);
                        } else {
                            session.setAttribute("message", "Error: Services Name is not null!");
                            response.sendRedirect("admin/index.jsp?cmd=CreateServ");
                        }
                    } else if (name.equals("cbbCategory")) {
                        Category cat = new Category();
                        cat.setCategoryId(Integer.parseInt(value));
                        sv.setCategory(cat);
                    } else if (name.equals("txtDescription")) {
                        if(!value.isEmpty()) {
                            sv.setDesription(value);
                        } else {
                            session.setAttribute("message", "Error: Description is not null!");
                            response.sendRedirect("admin/index.jsp?cmd=CreateServ");
                        }
                    } else if (name.equals("txtPrice")) {
                        if(!value.isEmpty()) {
                            if(vd.checkIsMoney(value)) {
                                sv.setPriceServices(BigDecimal.valueOf(Double.parseDouble(value)));
                            } else {
                                session.setAttribute("message", "Error: Price is not format(Price is number)!");
                                response.sendRedirect("admin/index.jsp?cmd=CreateServ");
                            }
                        } else {
                            session.setAttribute("message", "Error: Price is not null!");
                            response.sendRedirect("admin/index.jsp?cmd=CreateServ");
                        }
                    } else if (name.equals("txtUnitServices")) {
                        sv.setUnit(value);
                    } else if (name.equals("txtDetails")) {
                        if(!value.isEmpty()) {
                            sv.setServicesDetails(value);
                        } else {
                            session.setAttribute("message", "Error: Details is not null!");
                            response.sendRedirect("admin/index.jsp?cmd=CreateServ");
                        }
                        
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
                    } else {
                         sv.setImagesSmall("094803039619lg.jpg");
                    }
                }
            }
            sv.setVisiable(0);
            if (sm.insertObject(sv) == true) {
                session.setAttribute("message", "Create a services Successfull!");
                response.sendRedirect("admin/index.jsp?cmd=ViewServ");
            } else {
                session.setAttribute("message", "Create a services Fail, Please try again!");
                response.sendRedirect("admin/index.jsp?cmd=CreateServ");
            }
        } catch (Exception ex) {
            Logger.getLogger(ActionFormServices.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
