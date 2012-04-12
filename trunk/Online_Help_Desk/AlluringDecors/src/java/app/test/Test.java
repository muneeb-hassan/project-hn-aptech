/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.test;

import app.bean.ContactUs;
import app.bean.OrderDetails;
import app.bean.Orders;
import app.bean.Services;
import app.bean.Users;
import app.helper.ValidateData;
import app.model.ContactUsModel;
import app.model.OrdersModel;
import app.model.ServicesModel;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) {
        try {
            ValidateData vd = ValidateData.getInstance();
            String xxx= "043222222";
            if (vd.checkIsPhone(xxx)) {
                System.out.println("TRUE");
            } else {
                System.out.println("FALSE");
            }
            /*OrdersModel om = OrdersModel.getInstance();
            Orders od = new Orders();
            od.setOrderId(1);
            od.setStatusOrder(1);
           // boolean flag = om.updateObject(od);
             boolean flag = om.deleteObject(1);
            if (flag) {
                System.out.println("TRUE");
            } else {
                System.out.println("FALSE");
            }
            /*
            List<Orders> lOrder = om.getListObject();
            for (int i= 0; i < lOrder.size(); i++) {
                String name = lOrder.get(i).getUsers().getEmail();
                Set<OrderDetails> sOD = lOrder.get(i).getOrderDetailses();
                Iterator ie = sOD.iterator();
                while(ie.hasNext()) {
                    OrderDetails od = (OrderDetails) ie.next();
                    System.out.println("ProductID:" + od.getServices().getServicesId());
                }
            }
            /*
            String str = "s";
            if(!str.isEmpty()) System.out.println("xxx");
           /* ServicesModel sm = ServicesModel.getInstance();
            List<Services> lServ = sm.getListObjectTop4();
            System.out.println("lServ.length:" + lServ.size());
            /*
            ContactUsModel cm = ContactUsModel.getInstance();
            ContactUs c = cm.getContactUs();
            System.out.println("COntent:" + c.getContents());

           /* OrdersModel om = OrdersModel.getInstance();
            Orders inforOrder = new Orders();
            String fullName = "vinhnv";
            String email = "vinhnv";
            String phone = "vinhnv";
            String address = "vinhnv";
            String startDate = "05/3/2011";
            String endDate = "05/3/2011";
            inforOrder.setFullName(fullName);
            inforOrder.setEmail(email);
            inforOrder.setAddress(address);
            inforOrder.setPhone(phone);
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Date date = df.parse(startDate);
            inforOrder.setStartDate(new java.sql.Date(date.getTime()));
            Date date2 = df.parse(endDate);
            inforOrder.setEndDate(new java.sql.Date(date2.getTime()));
            Users infor = new Users();
            infor.setUserId(1);
            inforOrder.setUsers(infor);
            Hashtable cart = new Hashtable();
            boolean flag = om.insertOrder(cart, inforOrder);
            if(flag == true) {
                System.out.println("OK");
            }else {
                System.out.println("No");
            }*/
        } catch (Exception ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
