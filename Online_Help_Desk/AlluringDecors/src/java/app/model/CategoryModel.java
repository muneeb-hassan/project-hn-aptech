/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Category;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class CategoryModel implements IAbstractModel<Category>{
    Session session = null;
    private static CategoryModel instance = null;

    public static CategoryModel getInstance() {
        if (instance == null) {
            instance = new CategoryModel();
        }
        return instance;
    }
    public List<Category> getListObject() {
        List<Category> lCategory = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from Category where Visiable = 0 order by CategoryName asc");
        lCategory = (List<Category>)query.list();
        return lCategory;
    }

    public Category getCategoryById(int objID) {
        Category cat = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Category where CategoryID='" + objID + "'");
            cat = (Category) query.uniqueResult();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return cat;
    }

    public boolean insertObject(Category t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(t);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean deleteObject(int objID) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("UPDATE Category SET Visiable = 1 where CategoryID = '" + objID + "'");
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

    public boolean updateObject(Category t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
             Query query = session.createQuery("UPDATE Category SET CategoryName = '" + t.getCategoryName() +"' where CategoryID = '" + t.getCategoryId() + "'");
            int row = query.executeUpdate();
            session.getTransaction().commit();
            if (row >= 1) {
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

    public List<Category> searchObject(String obj) {
        List<Category> lCategory = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from Category where CategoryName like %" + obj + "%");
        lCategory = query.list();
        return lCategory;
    }

}
