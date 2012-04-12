/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Cart;
import app.bean.OrderDetails;
import app.bean.Orders;
import app.bean.Services;
import app.helper.HibernateUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class OrdersModel implements IAbstractModel<Orders>{
    private static OrdersModel instance = null;
    Session session = null;
    private OrdersModel(){}
    public static OrdersModel getInstance() {
        if (instance == null) {
            instance = new OrdersModel();
        }
        return instance;
    }
    public List<Orders> getListObject() {
        List<Orders> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Orders where Visiable = 0 order by OrderID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public List<Orders> getListOrderByUserID(int objID) {
        List<Orders> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Orders where UserID ='"+ objID +"' and Visiable = 0 order by OrderID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public Orders getObjectById(int id) {
        Orders od = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Orders where OrderID ='" + id +"' and Visiable = 0");
            od = (Orders) query.uniqueResult();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return od;
    }

    public boolean insertObject(Orders t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(t);
            session.getTransaction().commit();
        }catch(Exception e) {
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean deleteObject(int objID) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Orders order = (Orders) session.get(Orders.class, objID);
            order.setVisiable(1);
            session.update(order);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
    }

    public boolean updateObject(Orders t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("UPDATE Orders SET StatusOrder='"+ t.getStatusOrder() +"' WHERE OrderID = '" + t.getOrderId() + "'");
            int count = query.executeUpdate();
            session.getTransaction().commit();
            if(count >= 1) {
                return true;
            }else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
    }

    

    public List<Orders> searchObject(String obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public boolean insertOrder(Hashtable cart, Orders inforOrder) {
        boolean flag = true;
        OrderDetails od = null;
        Services serv = null;
        Orders o = null;
        Cart c = null;
        try {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(inforOrder);
        int orderId = inforOrder.getOrderId();
        Enumeration e = cart.keys();
        while(e.hasMoreElements()) {
            int idx = Integer.parseInt(e.nextElement().toString());
            c = (Cart) cart.get(idx);
            od = new OrderDetails();
             o = new Orders();
            o.setOrderId(orderId);
            od.setOrders(o);
            serv = new Services();
            serv.setServicesId(c.getServicesID());
            od.setServices(serv);
            od.setQuantity(c.getQuantity());
            od.setUnitPrice(c.getPrice());
            session.save(od);
            //listOrderDetaisl.add(od);
        }/**/
        //session.save(listOrderDetaisl);
        session.getTransaction().commit();
        flag = true;
        }catch(Exception ex) {
            session.getTransaction().rollback();
            System.out.println("Error:" + ex.getMessage());
            return false;
        }
        return flag;
    }
}
