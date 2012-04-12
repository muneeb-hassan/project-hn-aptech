/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Administrator;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class AdministratorModel implements IAbstractModel<Administrator>{
    private static AdministratorModel instance = null;
    Session session = null;
    
    public static AdministratorModel getInstance() {
        if (instance == null) {
            instance = new AdministratorModel();
        }
        return instance;
    }
    public List<Administrator> getListObject() {
        List<Administrator> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Administrator where Visiable = 0 order by AdministratorID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public Administrator getAdministrator(Administrator a) {
        Administrator admin = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Administrator where UserName='" + a.getUserName() + "' and Password='" + a.getPassword() +"'");
            admin = (Administrator) query.uniqueResult();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return admin;
    }

    public Administrator getAdministratorByID(int objID) {
        Administrator admin = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        admin = (Administrator)session.get(Administrator.class, objID);
        return admin;
    }

    public boolean insertObject(Administrator t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(t);
            session.getTransaction().commit();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean deleteObject(int objID) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("UPDATE Administrator SET Visiable = 1 where AdministratorID = '" + objID + "'");
            int row = query.executeUpdate();
            session.getTransaction().commit();
            if (row >= 1) {
                return true;
            }else {
                return false;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
            return false;
        }
    }

    public boolean updateObject(Administrator t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query q = session.createQuery("update Administrator set UserName='" + t.getUserName()
                    + "', Password='" + t.getPassword()
                    + "', FullName='" + t.getFullName()
                    + "', Address='" + t.getAddress()
                    + "', Phone='" + t.getPhone()
                    + "', Email='" + t.getEmail()
                    + "', Roles='" + t.getRoles()
                    + "', Visiable='" + t.getVisiable()
                    + "' where AdministratorID='" + t.getAdministratorId() +"'");
            int count = q.executeUpdate();
            session.getTransaction().commit();
            if (count >= 1) {
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

    public List<Administrator> searchObject(String obj) {
        List<Administrator> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Administrator where FullName like %" + obj + "%");
        lObject = q.list();
        session.getTransaction().commit();
        return lObject;
    }

}
