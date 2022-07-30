/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.Entity;

/**
 *
 * @author SANT JI
 */
public class User {
    private int uid;
    private String uname,uemail,uphone,usecurity,uanswer,upassword,address,city,state,country;

    public User(int uid, String uname, String uemail, String uphone, String usecurity, String uanswer, String upassword, String address, String city, String state, String country) {
        this.uid = uid;
        this.uname = uname;
        this.uemail = uemail;
        this.uphone = uphone;
        this.usecurity = usecurity;
        this.uanswer = uanswer;
        this.upassword = upassword;
        this.address = address;
        this.city = city;
        this.state = state;
        this.country = country;
    }

    public User(String uname, String uemail, String uphone, String usecurity, String uanswer, String upassword, String address, String city, String state, String country) {
        this.uname = uname;
        this.uemail = uemail;
        this.uphone = uphone;
        this.usecurity = usecurity;
        this.uanswer = uanswer;
        this.upassword = upassword;
        this.address = address;
        this.city = city;
        this.state = state;
        this.country = country;
    }

    public User(int uid, String uname, String uemail, String uphone, String usecurity, String uanswer, String upassword) {
        this.uid = uid;
        this.uname = uname;
        this.uemail = uemail;
        this.uphone = uphone;
        this.usecurity = usecurity;
        this.uanswer = uanswer;
        this.upassword = upassword;
    }

    public User(String uname, String uemail, String uphone, String usecurity, String uanswer, String upassword) {
        this.uname = uname;
        this.uemail = uemail;
        this.uphone = uphone;
        this.usecurity = usecurity;
        this.uanswer = uanswer;
        this.upassword = upassword;
    }

    public User() {
    }
    

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getUsecurity() {
        return usecurity;
    }

    public void setUsecurity(String usecurity) {
        this.usecurity = usecurity;
    }

    public String getUanswer() {
        return uanswer;
    }

    public void setUanswer(String uanswer) {
        this.uanswer = uanswer;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

  
}
