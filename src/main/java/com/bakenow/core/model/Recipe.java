/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author tlminh
 */
public class Recipe {
    private Integer id;
    private Integer authorId;
    private String authorName;
    private Timestamp createTime;
    private Timestamp modifyTime;
    private Timestamp approvalTime;
    private Integer approverId;
    private Integer approverName;
    private String title;
    private String contents;
    private ArrayList<String> steps;
    private Integer timeToCook;
    private Double rating;
    private Integer ratingCount;
    private Byte statusId;
    private Boolean available;

    public Recipe() {
    }

    public Recipe(Integer id, Integer authorId, String authorName, Timestamp createTime, Timestamp modifyTime, Timestamp approvalTime, Integer approverId, Integer approverName, String title, String contents, ArrayList<String> steps, Integer timeToCook, Double rating, Integer ratingCount, Byte statusId, Boolean available) {
        this.id = id;
        this.authorId = authorId;
        this.authorName = authorName;
        this.createTime = createTime;
        this.modifyTime = modifyTime;
        this.approvalTime = approvalTime;
        this.approverId = approverId;
        this.approverName = approverName;
        this.title = title;
        this.contents = contents;
        this.steps = steps;
        this.timeToCook = timeToCook;
        this.rating = rating;
        this.ratingCount = ratingCount;
        this.statusId = statusId;
        this.available = available;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Timestamp getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(Timestamp approvalTime) {
        this.approvalTime = approvalTime;
    }

    public Integer getApproverId() {
        return approverId;
    }

    public void setApproverId(Integer approverId) {
        this.approverId = approverId;
    }

    public Integer getApproverName() {
        return approverName;
    }

    public void setApproverName(Integer approverName) {
        this.approverName = approverName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public ArrayList<String> getSteps() {
        return steps;
    }

    public void setSteps(ArrayList<String> steps) {
        this.steps = steps;
    }

    public Integer getTimeToCook() {
        return timeToCook;
    }

    public void setTimeToCook(Integer timeToCook) {
        this.timeToCook = timeToCook;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public Integer getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(Integer ratingCount) {
        this.ratingCount = ratingCount;
    }

    public Byte getStatusId() {
        return statusId;
    }

    public void setStatusId(Byte statusId) {
        this.statusId = statusId;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }
    
    
}
