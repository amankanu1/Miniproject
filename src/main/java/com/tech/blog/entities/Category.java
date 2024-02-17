
package com.tech.blog.entities;

public class Category {
    private int cid;
    private String Cname;
    private String description;

    public Category(int cid, String Cname, String description) {
        this.cid = cid;
        this.Cname = Cname;
        this.description = description;
    }

    public Category() {
    }

    public Category(String Cname, String description) {
        this.Cname = Cname;
        this.description = description;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String Cname) {
        this.Cname = Cname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
    
    
    
}
