/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Feedback;
import app.helper.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class FeedbackModel implements IAbstractModel<Feedback>{
    private static FeedbackModel instance = null;
    Session session = null;
    private FeedbackModel(){}
    public static FeedbackModel getInstance() {
        if (instance == null) {
            instance = new FeedbackModel();
        }
        return instance;
    }
    public List<Feedback> getListObject() {
        List<Feedback> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Feedback where Visable = 0 order by FeedbackID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public Feedback getObjectById(int id) {
        Feedback fb = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Feedback where FeedbackID='" + id +"' and Visiable = 0");
            fb = (Feedback) query.uniqueResult();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return fb;
    }

    public boolean  realyFeedback(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("UPDATE Feedback SET ReadFeedback = 1 where FeedbackID = '" + id + "'");
        int row = query.executeUpdate();
        session.getTransaction().commit();
        if (row >= 1) {
            return true;
        }else {
            return false;
        }
    }

    public boolean insertObject(Feedback t) {
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
            Feedback fb = (Feedback) session.get(Feedback.class, objID);
            fb.setVisiable(1);
            session.update(fb);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
    }

    public boolean updateObject(Feedback t) {
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

    public List<Feedback> searchObjectByDate(Date currentDate) {
        List<Feedback> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Feedback where CreateDate = " + currentDate + "order by FeedbackID desc");
        lObject = q.list();
        session.getTransaction().commit();
        return lObject;
    }
    public List<Feedback> searchObject(String obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
