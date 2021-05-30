package com.toron.dto;

public class CommentBeanFree {
    private int no=0;
    private int commnetNo=0;
    private String id=null;
    private String comment =null;
    private String c_date;

    public CommentBeanFree() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getCommnetNo() {
        return commnetNo;
    }

    public void setCommnetNo(int commnetNo) {
        this.commnetNo = commnetNo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getC_date() {
        return c_date;
    }

    public void setC_date(String c_date) {
        this.c_date = c_date;
    }
}
