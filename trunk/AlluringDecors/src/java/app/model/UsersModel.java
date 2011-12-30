/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Users;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class UsersModel implements IAbstractModel<Users> {
    Session session = null;
    private static UsersModel instance = null;

    public static UsersModel getInstance() {
        if (instance == null) {
            instance = new UsersModel();
        }
        return instance;
    }

    public List<Users> getListObject() {
        List<Users> lUsers = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Users where Visiable = 0 order by UserID desc");
        lUsers = q.list();
        session.getTransaction().begin();
        return lUsers;
    }

    public boolean insertObject(Users t) {
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
            Users u = (Users) session.get(Users.class, objID);
            u.setVisiable(1);
            session.update(u);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
    }

    public boolean updateObject(Users t) {
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

    public List<Users> searchObject(String obj) {
        List<Users> lUsers = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Users where FullName like %" + obj + "%");
        lUsers = q.list();
        session.getTransaction().commit();
        return lUsers;
    }

    public Users getUserByLogin(String user, String pass) {
        Users u = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Users where UserName='" + user + "' and Passowrd='" + pass +"'");
            u = (Users) query.uniqueResult();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return u;
    }

}
