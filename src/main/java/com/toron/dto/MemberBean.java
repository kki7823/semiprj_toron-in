package com.toron.dto;

public class MemberBean {
    //test1 1234 이영
    private String id=null;
    private String pwd=null;
    private String name=null;
    private String nick=null;
    private String phone=null;
    private String email=null;
    private String address=null;
    private String zipcode=null;
    private String[] interest=null;
    private String photo=null; //default: 'default.jsp"
    private String m_date=null; //default: sysdate
    private String isAdmin=null; //default: 'no'

    public MemberBean() {
    }

    public String getId() {
        return id;
    }

    public String getPwd() {
        return pwd;
    }

    public String getName() {
        return name;
    }

    public String getNick() {
        return nick;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getZipcode() {
        return zipcode;
    }


    public String[] getInterest() {
        return interest;
    }

    public String getPhoto() {
        return photo;
    }

    public String getM_date() {
        return m_date;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }


    public void setInterest(String[] interest) {
        this.interest = interest;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public void setM_date(String m_date) {
        this.m_date = m_date;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

}