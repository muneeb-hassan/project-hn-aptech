/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.controller;

import app.bean.Orders;
import app.bean.Payment;
import app.bean.PaymentDetails;
import app.model.PaymentDetailsModel;
import app.model.PaymentModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class FormActionPayment extends HttpServlet {
    PaymentModel pm = PaymentModel.getInstance();
    PaymentDetailsModel pdm = PaymentDetailsModel.getInstance();
    Payment p = null;
    HttpSession session = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("btnPayment") != null) {
                processPayment(request, response);
            } else if(request.getParameter("btnPayment2") != null) {
                processRePayment(request, response);
            }
        } finally { 
            out.close();
        }
    }

    private void processPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            p = new Payment();
            PaymentDetails pd = new PaymentDetails();
            String dtEnd = request.getParameter("txtDateFinal");
            String typePay = request.getParameter("cbbTypePay");
            String odID = request.getParameter("txtID");
            String duePay = request.getParameter("txtDueMoney");
            String totalMoney = request.getParameter("txtTotalMoney");
            String money = request.getParameter("txtMoney");
            int type = Integer.parseInt(typePay);
            if(type == 0) {
                p.setStatusPay(0);
            } else if(type == 1) {
                p.setStatusPay(1);
            }
            p.setPaymentId(type);
            Orders o = new Orders();
            o.setOrderId(Integer.parseInt(odID));
            p.setOrders(o);
            p.setDuePay(BigDecimal.valueOf(Double.parseDouble(duePay)));
            p.setTotalAmount(BigDecimal.valueOf(Double.parseDouble(totalMoney)));
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Date dateEnd = df.parse(dtEnd);
            p.setPaymentDateFinal(dateEnd);
            
            pd.setPaidAmount(BigDecimal.valueOf(Double.parseDouble(money)));
            Date d = new Date();
            pd.setDatePaid(d);
            boolean flag = pm.insertPayment(p, pd);
            if (flag) {
                response.sendRedirect("admin/index.jsp?cmd=payment&id=" + odID);
            } else {
                response.sendRedirect("admin/index.jsp?cmd=payment&id=" + odID);
            }
        } catch (ParseException ex) {
            Logger.getLogger(FormActionPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void processRePayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String money = request.getParameter("txtMoney");
        String payID = request.getParameter("txtPayID");
        String leftPay = request.getParameter("totalLeftPay");
        String orderID = request.getParameter("txtOrderID");

        float moneyx = Float.parseFloat(money);
        float leftPayx = Float.parseFloat(leftPay);
        boolean check = true;
        if(moneyx >= leftPayx) {
            check = pm.updateStatusPayment(Integer.parseInt(payID));
        }
        PaymentDetails pd = new PaymentDetails();
        Date d = new Date();
        pd.setDatePaid(d);
        pd.setPaidAmount(BigDecimal.valueOf(Double.parseDouble(money)));
        p = new Payment();
        p.setPaymentId(Integer.parseInt(payID));
        pd.setPayment(p);
        boolean flag = pdm.insertObject(pd);
        if (flag) {
            response.sendRedirect("admin/index.jsp?cmd=payment&id=" + orderID);
        } else {
            response.sendRedirect("admin/index.jsp?cmd=payment&id=" + orderID);
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
