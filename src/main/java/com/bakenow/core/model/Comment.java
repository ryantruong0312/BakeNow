/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.sql.Date;

/**
 *
 * @author tlminh
 */
public class Comment {

    private int id;
    private int userId;
    private String userName;
    private String avatarUrl;
    private Date createTime;
    private String contents;

    public Comment() {
    }

    public Comment(int id, int userId, String userName, String avatarUrl, Date createTime, String contents) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.avatarUrl = avatarUrl;
        this.createTime = createTime;
        this.contents = contents;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public boolean checkAvatarUrl() {
        boolean check = this.avatarUrl.contains("\\assets\\img");
        return check;
    }

    public String getImgName() {
        try {
            int index = this.avatarUrl.indexOf('/');
            String after = this.avatarUrl.substring(index + 1);
            return after;
        } catch (Exception e) {
        }
        return null;
    }

}
