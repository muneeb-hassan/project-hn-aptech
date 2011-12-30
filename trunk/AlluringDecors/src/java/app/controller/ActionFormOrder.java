/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.controller;

import app.bean.Cart;
import app.bean.Orders;
import app.bean.Services;
import app.bean.Users;
import app.helper.ValidateData;
import app.model.OrdersModel;
import app.model.ServicesModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
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
public class ActionFormOrder extends HttpServlet {
    Cart c = null;
    Hashtable cart = null;
    Services serv = null;
    HttpSession cartSession = null;
    ServicesModel sm = ServicesModel.getInstance();
    OrdersModel om = OrdersModel.getInstance();
    ValidateData vd = ValidateData.getInstance();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String cmd = request.getParameter("cmd");
            if (cmd.equals("addCart") == true) {
                processAddCart(request, response);
            }else if (cmd.equals("updateCart") == true) {
                processEditCart(request, response);
            }else if (cmd.equals("delCart") == true) {
                processDelCart(request, response);
            }else if (cmd.equals("removeCart") == true) {
                processRemoveCart(request, response);
            }else if (cmd.equals("checkout") == true) {
                processCheckOut(request, response);
            }else if(cmd.equals("process") == true) {
                processOrder(request, response);
            } else if(cmd.equals("update") == true) {
                processUpdateStatusOrder(request, response);
            } else if(cmd.equals("del") == true) {
                processDelOrder(request, response);
            }
        } finally { 
            out.close();
        }
    }

    private void processAddCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            cartSession = request.getSession(true);
            cart = (Hashtable) cartSession.getAttribute("cart");
            String idx = request.getParameter("id");
            if (idx != null) {
                int id = Integer.parseInt(idx);
                if (cart == null) {
                    cart = new Hashtable();
                    serv = sm.getServicesById(id);
                    if (serv != null) {
                        c = new Cart();
                        c.setServicesID(serv.getServicesId());
                        c.setServicesName(serv.getServicesName());
                        c.setUrlImages(serv.getImagesSmall());
                        c.setPrice(serv.getPriceServices());
                        c.setQuantity(1);
                        cart.put(id, c);
                        cartSession.setAttribute("cart", cart);
                        response.sendRedirect("home/index.jsp?cmd=viewCart");
                    }else {
                        response.sendRedirect("home/index.jsp");
                    }
                }else {
                    if (cart.containsKey(id)) {
                        c = (Cart)cart.get(id);
                        c.setQuantity(c.getQuantity() + 1);
                        cart.remove(id);
                        cart.put(id, c);
                    }else {
                        serv = sm.getServicesById(id);
                        if (serv != null) {
                            c = new Cart();
                            c.setServicesID(serv.getServicesId());
                            c.setServicesName(serv.getServicesName());
                            c.setUrlImages(serv.getImagesSmall());
                            c.setPrice(serv.getPriceServices());
                            c.setQuantity(1);
                            cart.put(id, c);
                        }else {
                            response.sendRedirect("home/index.jsp");
                        }
                    }
                    cartSession.setAttribute("cart", cart);
                    response.sendRedirect("home/index.jsp?cmd=viewCart");
                }
            }else {
                response.sendRedirect("home/index.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(ActionFormOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void processEditCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try{
        cartSession = request.getSession();
        cart = (Hashtable)cartSession.getAttribute("cart");
            Enumeration e = cart.keys();
            while(e.hasMoreElements()) {
                int id = Integer.parseInt(e.nextElement().toString());
                String quantityx = request.getParameter("txtQuantity_" + id);
                if(vd.checkIsNumber(quantityx)) {
                    if(quantityx != null) {
                        c = (Cart)cart.get(id);
                        try {
                            c.setQuantity(Integer.parseInt(quantityx));
                        }catch(Exception ex) {
                            cartSession.setAttribute("error", "Cannot update Quantity, Please try again!");
                            response.sendRedirect("home/index.jsp?cmd=viewCart");
                        }
                        cart.remove(id);
                        cart.put(id, c);
                    }
                } else {
                    cartSession.setAttribute("error", "Error: Quantity is not Number.");
                    cartSession.setAttribute("cart", cart);
                    response.sendRedirect("home/index.jsp?cmd=viewCart");
                }
            }
            cartSession.setAttribute("cart", cart);
            response.sendRedirect("home/index.jsp?cmd=viewCart");
        } catch (Exception ex) {
            Logger.getLogger(ActionFormOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void processDelCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            cartSession = request.getSession();
            cart = (Hashtable)cartSession.getAttribute("cart");
            String idx = request.getParameter("id");
            if (cart != null) {
                if(idx != null) {
                    int id = Integer.parseInt(idx);
                    if (cart.containsKey(id)) {
                        cart.remove(id);
                        response.sendRedirect("home/index.jsp?cmd=viewCart");
                    } else {
                        cartSession.setAttribute("message", "Services does not exist!");
                        response.sendRedirect("home/index.jsp?cmd=viewCart");
                    }
                }
            }else {
                response.sendRedirect("home/index.jsp?cmd=viewCart");
            }
        } catch (Exception ex) {
            Logger.getLogger(ActionFormOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void processRemoveCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        cartSession = request.getSession();
        cart = (Hashtable)cartSession.getAttribute("cart");
        cart.clear();
        response.sendRedirect("home/index.jsp?cmd=viewCart");
    }

    private void processCheckOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        cartSession = request.getSession(true);
        if (cartSession.getAttribute("loginx") == null) {
            response.sendRedirect("home/index.jsp?cmd=login");
        } else {
            response.sendRedirect("home/index.jsp?cmd=checkout");
        }
    }

    private void processOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            cartSession = request.getSession(true);
            cart = (Hashtable) cartSession.getAttribute("cart");
            Users infor = (Users) cartSession.getAttribute("loginx");
            Orders inforOrder = new Orders();
            String fullName = request.getParameter("txtFullName");
            String email = request.getParameter("txtEmail");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");
            String startDate = request.getParameter("txtStartDate");
            String endDate = request.getParameter("txtEndDate");

            if(startDate.isEmpty() || endDate.isEmpty()) {
                cartSession.setAttribute("error", "Error: Date is not empty!");
                response.sendRedirect("home/index.jsp?cmd=checkout");
            } else if(!vd.checkIsEmail(email)) {
                cartSession.setAttribute("error", "Error: Email is not validate!");
                response.sendRedirect("home/index.jsp?cmd=checkout");
            } else if (fullName.isEmpty()) {
                cartSession.setAttribute("error", "Error: FullName is not empty!");
                response.sendRedirect("home/index.jsp?cmd=checkout");
            } else if (address.isEmpty()) {
                cartSession.setAttribute("error", "Error: Address is not empty!");
                response.sendRedirect("home/index.jsp?cmd=checkout");
            } else if (phone.isEmpty()) {
                cartSession.setAttribute("error", "Error: Phone is not empty!");
                response.sendRedirect("home/index.jsp?cmd=checkout");
            }

            inforOrder.setFullName(fullName);
            inforOrder.setEmail(email);
            inforOrder.setAddress(address);
            inforOrder.setPhone(phone);
            inforOrder.setVisiable(0);
            inforOrder.setStatusOrder(0);
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Date d = new Date();
            inforOrder.setOrderDate(d);
            Date date = df.parse(startDate);
            inforOrder.setStartDate(new java.sql.Date(date.getTime()));
            Date date2 = df.parse(endDate);
            if(date2.after(date)) {
                cartSession.setAttribute("error", "Error: EndDate is not before StartDate!");
                response.sendRedirect("home/index.jsp?cmd=checkout");
            }
            inforOrder.setEndDate(new java.sql.Date(date2.getTime()));
            inforOrder.setUsers(infor);
            boolean flag = om.insertOrder(cart, inforOrder);
            if(flag == true) {
                cartSession.removeAttribute("cart");
                cartSession.setAttribute("messageProcess", "Process cart successfull!");
                response.sendRedirect("home/index.jsp?cmd=complete");
            } else {
                cartSession.removeAttribute("cart");
                response.sendRedirect("home/index.jsp?cmd=error");
            }
             
        } catch (ParseException ex) {
            Logger.getLogger(ActionFormOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void processUpdateStatusOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idx = request.getParameter("id");
        String statusx = request.getParameter("s");
        Orders od = new Orders();
        int id = Integer.parseInt(idx);
        int status = Integer.parseInt(statusx);
        od.setOrderId(id);
        od.setStatusOrder(status);
        boolean flag = om.updateObject(od);
        response.sendRedirect("admin/index.jsp?cmd=OrdersDetails&id=" + id);
    }

    private void processDelOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idx = request.getParameter("id");
        int id = Integer.parseInt(idx);
        boolean flag = om.deleteObject(id);
        if(flag) {
            
        } else {
            
        }
        response.sendRedirect("admin/index.jsp?cmd=ViewOrder");
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
