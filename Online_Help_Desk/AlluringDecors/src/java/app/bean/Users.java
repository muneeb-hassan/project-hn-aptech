package app.bean;
// Generated Feb 26, 2011 1:22:36 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private int userId;
     private String userName;
     private String passowrd;
     private String fullName;
     private String address;
     private String email;
     private String phone;
     private Integer visiable;
     private Set<Orders> orderses = new HashSet<Orders>(0);

    public Users() {
    }

	
    public Users(int userId, String userName, String passowrd, String fullName, String address, String email, String phone) {
        this.userId = userId;
        this.userName = userName;
        this.passowrd = passowrd;
        this.fullName = fullName;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }
    public Users(int userId, String userName, String passowrd, String fullName, String address, String email, String phone, Integer visiable, Set<Orders> orderses) {
       this.userId = userId;
       this.userName = userName;
       this.passowrd = passowrd;
       this.fullName = fullName;
       this.address = address;
       this.email = email;
       this.phone = phone;
       this.visiable = visiable;
       this.orderses = orderses;
    }
   
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassowrd() {
        return this.passowrd;
    }
    
    public void setPassowrd(String passowrd) {
        this.passowrd = passowrd;
    }
    public String getFullName() {
        return this.fullName;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public Integer getVisiable() {
        return this.visiable;
    }
    
    public void setVisiable(Integer visiable) {
        this.visiable = visiable;
    }
    public Set<Orders> getOrderses() {
        return this.orderses;
    }
    
    public void setOrderses(Set<Orders> orderses) {
        this.orderses = orderses;
    }




}


