package com.toron.dto;

public class ListBean {
    private int no = 0;
    private String type = null;
    private String category = null;
    private String title = null;
    private String content = null;
    private String id = null;
    private String w_date = null;
    private int hit = 0;
    private String upload = null;
    private int good = 0;

    public ListBean() {
    }

    public int getNo() { return no; }

    public void setNo(int no) { this.no = no; }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getW_date() {
        return w_date;
    }

    public void setW_date(String w_date) {
        this.w_date = w_date;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public String getUpload() {
        return upload;
    }

    public void setUpload(String upload) {
        this.upload = upload;
    }

    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }

}