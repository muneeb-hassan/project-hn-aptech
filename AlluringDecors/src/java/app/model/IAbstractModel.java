/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.model;

import java.util.List;

/**
 *
 * @author Admin
 */
public interface IAbstractModel<T> {
    public List<T> getListObject();
    public boolean insertObject(T t);
    public boolean deleteObject(int objID);
    public boolean updateObject(T t);
    public List<T> searchObject(String obj);
}
