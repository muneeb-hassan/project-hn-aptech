/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.ContactUs;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class ContactUsModel implements IAbstractModel<ContactUs>{
    private static ContactUsModel instance = null;
    Session session = null;
    private ContactUsModel(){}
    public static ContactUsModel getInstance() {
        if (instance == null) {
            instance = new ContactUsModel();
        }
        return instance;
    }
    public List<ContactUs> getListObject() {
        List<ContactUs> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from ContactUs order by ContactUsID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public ContactUs getContactUs() {
        ContactUs c = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from ContactUs where contactId =  (select max(contactId) from ContactUs)");
        c = (ContactUs) query.uniqueResult();
        return c;
    }

    public boolean insertObject(ContactUs t) {
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

    public boolean updateObject(ContactUs t) {
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

    public List<ContactUs> searchObject(String obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
