/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.model;

import app.bean.Faqs;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class FaqsModel implements IAbstractModel<Faqs> {

    private static FaqsModel instance = null;
    Session session = null;

    private FaqsModel() {
    }

    public static FaqsModel getInstance() {
        if (instance == null) {
            instance = new FaqsModel();
        }
        return instance;
    }

    public List<Faqs> getListObject() {
        List<Faqs> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Faqs order by FaqsID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public Faqs getObjectFaqs(int id) {
        Faqs obj = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Faqs where FaqsID='" + id + "'");
            obj = (Faqs) query.uniqueResult();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return obj;
    }

    public boolean insertObject(Faqs t) {
        try {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(t);
        session.getTransaction().commit();
        return true;
        }catch(Exception e) {
            return false;
        }
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

    public boolean updateObject(Faqs t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query q = session.createQuery("update FAQS set Question='" + t.getQuestion() + "', Answer='" + t.getAnswer() + "', Visiable='" + t.getVisiable() + "' where FAQSID='" + t.getFaqsid() + "'");
            int count = q.executeUpdate();
            session.getTransaction().commit();
            if (count >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
    }

    public List<Faqs> searchObject(String obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
