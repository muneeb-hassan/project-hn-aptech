/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.OrderDetails;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class OrderDetailsModel implements IAbstractModel<OrderDetails>{
    private static OrderDetailsModel instance = null;
    Session session = null;
    private OrderDetailsModel(){}
    public static OrderDetailsModel getInstance() {
        if (instance == null) {
            instance = new OrderDetailsModel();
        }
        return instance;
    }
    public List<OrderDetails> getListObject() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public boolean insertObject(OrderDetails t) {
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
            session.delete(objID);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean updateObject(OrderDetails t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.update(t);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public List<OrderDetails> searchObject(String obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
