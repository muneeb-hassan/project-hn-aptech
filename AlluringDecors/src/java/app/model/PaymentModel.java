/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Payment;
import app.bean.PaymentDetails;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class PaymentModel implements IAbstractModel<Payment>{
    private static PaymentModel instance = null;
    Session session = null;
    private PaymentModel(){}
    public static PaymentModel getInstance() {
        if (instance == null) {
            instance = new PaymentModel();
        }
        return instance;
    }

    public List<Payment> getListObject() {
        List<Payment> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Payment order by PaymentID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }
    
    public List<Payment> getListObjectByID(int objID) {
        List<Payment> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Payment where OrderID ="+objID +" and order by PaymentID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public boolean  insertPayment(Payment p, PaymentDetails pd) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            PaymentDetails pdx = null;
            session.save(p);
            pd.setPayment(p);
            session.save(pd);
            session.getTransaction().commit();
        }catch(Exception e) {
            System.out.println("Error:" + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
         return true;
    }

    public boolean updateStatusPayment(int id) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("UPDATE Payment SET StatusPay = 0 WHERE PaymentID = '" + id + "'");
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

    public boolean insertObject(Payment t) {
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

    public boolean updateObject(Payment t) {
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

    public List<Payment> searchObject(String obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
