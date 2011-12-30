/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.PaymentDetails;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class PaymentDetailsModel implements IAbstractModel<PaymentDetails>{
    private static PaymentDetailsModel instance = null;
    Session session = null;
    private PaymentDetailsModel(){}
    public static PaymentDetailsModel getInstance() {
        if (instance == null) {
            instance = new PaymentDetailsModel();
        }
        return instance;
    }

    public List<PaymentDetails> getListObject() {
        List<PaymentDetails> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from PaymentDetails order by PaymentDetailsID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public List<PaymentDetails> getListObject(int objID) {
        List<PaymentDetails> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from PaymentDetails where PaymentID=" + objID + " and order by PaymentDetails desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public boolean insertObject(PaymentDetails t) {
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

    public boolean updateObject(PaymentDetails t) {
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

    public List<PaymentDetails> searchObject(String obj) {
        List<PaymentDetails> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from PaymentDetails where ProjectName like %" + obj + "%");
        lObject = q.list();
        session.getTransaction().commit();
        return lObject;
    }

}
