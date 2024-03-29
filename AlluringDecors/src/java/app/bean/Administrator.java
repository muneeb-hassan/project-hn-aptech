package app.bean;
// Generated Feb 26, 2011 1:22:36 PM by Hibernate Tools 3.2.1.GA



/**
 * Administrator generated by hbm2java
 */
public class Administrator  implements java.io.Serializable {


     private int administratorId;
     private String userName;
     private String password;
     private String fullName;
     private String address;
     private String phone;
     private String email;
     private Integer roles;
     private Integer visiable;

    public Administrator() {
    }

	
    public Administrator(int administratorId, String userName, String password, String fullName, String address, String phone, String email) {
        this.administratorId = administratorId;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }
    public Administrator(int administratorId, String userName, String password, String fullName, String address, String phone, String email, Integer roles, Integer visiable) {
       this.administratorId = administratorId;
       this.userName = userName;
       this.password = password;
       this.fullName = fullName;
       this.address = address;
       this.phone = phone;
       this.email = email;
       this.roles = roles;
       this.visiable = visiable;
    }
   
    public int getAdministratorId() {
        return this.administratorId;
    }
    
    public void setAdministratorId(int administratorId) {
        this.administratorId = administratorId;
    }
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
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
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public Integer getRoles() {
        return this.roles;
    }
    
    public void setRoles(Integer roles) {
        this.roles = roles;
    }
    public Integer getVisiable() {
        return this.visiable;
    }
    
    public void setVisiable(Integer visiable) {
        this.visiable = visiable;
    }




}


