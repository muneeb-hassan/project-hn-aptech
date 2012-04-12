/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Services;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class ServicesModel implements IAbstractModel<Services>{
    private static ServicesModel instance = null;
    Session session = null;
    private ServicesModel(){}
    public static ServicesModel getInstance() {
        if (instance == null) {
            instance = new ServicesModel(); 
        }
        return instance;
    }

    public List<Services> getListObjectById(int objID) {
        List<Services> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Services where CategoryID = "+ objID + " and Visiable = 0 order by ServicesID desc");
        lObject = q.list();
        //session.getTransaction().begin();
        return lObject;
    }

    public List<Services> getListObject() {
        List<Services> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Services where Visiable = 0 order by ServicesID desc");
        lObject = q.list();
        //session.getTransaction().begin();
        return lObject;
    }

    public List<Services> getListObjectTop4() {
        List<Services> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Services where Visiable = 0 order by ServicesID desc");
        q.setMaxResults(4);
        lObject = (List<Services>)q.list();
        //session.getTransaction().begin();
        return lObject;
    }

    public boolean insertObject(Services t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(t);
            session.getTransaction().commit();
        }catch(Exception e) {
            System.out.println("Error UsersModel" + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean deleteObject(int objID) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Services serv = (Services)session.get(Services.class, objID);
            serv.setVisiable(1);
            session.update(serv);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean updateObject(Services t) {
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

    public List<Services> searchObject(String obj) {
        List<Services> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        try {
            Query q = session.createQuery("from Services where ServicesName like ?");
            String temp = "%" + obj + "%";
            q.setString(0, temp);
            lObject = q.list();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return lObject;
    }

    public List<Services> searchObjectByName(String obj, int id) {
        List<Services> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String str = "";
        if(id == 0) {
            str +="from Services where ServicesName like ? and Visiable = 0";
        } else {
            str +="from Services where ServicesName like ? and CategoryID='" + id + "' and Visiable = 0";
        }
        String temp = "%" + obj + "%";
        Query q = session.createQuery(str);
        q.setString(0, temp);
        lObject = q.list();
        return lObject;
    }

    public Services getServicesById(int id) {
        Services serv = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Services where ServicesID='" + id +"' and Visiable = 0");
            serv = (Services) query.uniqueResult();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return serv;
    }
}
