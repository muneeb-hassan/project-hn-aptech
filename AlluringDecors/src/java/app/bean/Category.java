package app.bean;
// Generated Feb 26, 2011 1:22:36 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Category generated by hbm2java
 */
public class Category  implements java.io.Serializable {


     private int categoryId;
     private Integer parentId;
     private String categoryName;
     private Integer visiable;
     private Set<Services> serviceses = new HashSet<Services>(0);

    public Category() {
    }

	
    public Category(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }
    public Category(int categoryId, Integer parentId, String categoryName, Integer visiable, Set<Services> serviceses) {
       this.categoryId = categoryId;
       this.parentId = parentId;
       this.categoryName = categoryName;
       this.visiable = visiable;
       this.serviceses = serviceses;
    }
   
    public int getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    public Integer getParentId() {
        return this.parentId;
    }
    
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    public String getCategoryName() {
        return this.categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public Integer getVisiable() {
        return this.visiable;
    }
    
    public void setVisiable(Integer visiable) {
        this.visiable = visiable;
    }
    public Set<Services> getServiceses() {
        return this.serviceses;
    }
    
    public void setServiceses(Set<Services> serviceses) {
        this.serviceses = serviceses;
    }




}

