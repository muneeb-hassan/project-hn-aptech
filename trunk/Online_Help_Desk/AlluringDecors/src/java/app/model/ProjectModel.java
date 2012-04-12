/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import app.bean.Project;
import app.helper.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Admin
 */
public class ProjectModel implements IAbstractModel<Project>{
    private static ProjectModel instance = null;
    Session session = null;
    private ProjectModel(){}
    public static ProjectModel getInstance() {
        if (instance == null) {
            instance = new ProjectModel();
        }
        return instance;
    }
    public List<Project> getListObject() {
        List<Project> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Project order by ProjectID desc");
        lObject = q.list();
        session.getTransaction().begin();
        return lObject;
    }

    public Project getObjectById(int id) {
        Project pro = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = session.createQuery("from Project where ProjectID='"+ id +"'");
            pro = (Project) query.uniqueResult();
        }catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return pro;
    }

    public boolean insertObject(Project t) {
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
            Project p = (Project) session.get(Project.class, objID);
            session.delete(p);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean updateObject(Project t) {
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            String strQuery = null;
            strQuery = "update Project set ProjectName=?, Images=?, Description=?, Details=?, StartDate=?, EndDate=?, StatusProject=?, Visiable=? where ProjectID=?";
            Query q = session.createQuery(strQuery);
            q.setString(0, t.getProjectName());
            q.setString(1, t.getImages());
            q.setString(2, t.getDescription());
            q.setString(3, t.getDetails());
            q.setDate(4, t.getStartDate());
            q.setDate(5, t.getEndDate());
            q.setInteger(6, t.getStatusProject());
            q.setInteger(7, t.getVisiable());
            q.setInteger(8, t.getProjectId());
            int count = q.executeUpdate();
            session.getTransaction().commit();
            if (count >= 1) {
                return true;
            }else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            session.getTransaction().rollback();
            return false;
        }
    }

    public List<Project> searchObject(String obj) {
        List<Project> lObject = null;
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Project where ProjectName like %" + obj + "%");
        lObject = q.list();
        session.getTransaction().commit();
        return lObject;
    }

}
