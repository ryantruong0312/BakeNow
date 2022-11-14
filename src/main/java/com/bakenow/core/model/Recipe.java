/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author tlminh
 */
public class Recipe {
    private int id;
    private int authorId;
    private String authorName;
    private Date createTime;
    private Date approvalTime;
    private int approverId;
    private String approverName;
    private String imgUrl;
    private String title;
    private String desc;
    private HashMap<Integer,String> steps;
    private HashMap<String,String> ingredients;
    private ArrayList<String> tools;
    private int cookTime;
    private int voteCount;
    private int statusId;
    private String authorAvatarUrl;
    private ArrayList<Comment> comments;
    private Date restrictionTime;
    private String restrictionReason;

    public Recipe() {
    }

    public Recipe(int id, int authorId, String authorName, Date createTime, Date approvalTime, int approverId, String approverName, String imgUrl, String title, String desc, HashMap<Integer, String> steps, HashMap<String, String> ingredients, ArrayList<String> tools, int cookTime, int voteCount, int statusId, String authorAvatarUrl, ArrayList<Comment> comments, Date restrictonTime, String restrictionReason) {
        this.id = id;
        this.authorId = authorId;
        this.authorName = authorName;
        this.createTime = createTime;
        this.approvalTime = approvalTime;
        this.approverId = approverId;
        this.approverName = approverName;
        this.imgUrl = imgUrl;
        this.title = title;
        this.desc = desc;
        this.steps = steps;
        this.ingredients = ingredients;
        this.tools = tools;
        this.cookTime = cookTime;
        this.voteCount = voteCount;
        this.statusId = statusId;
        this.authorAvatarUrl = authorAvatarUrl;
        this.comments = comments;
        this.restrictionTime = restrictonTime;
        this.restrictionReason = restrictionReason;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(Date approvalTime) {
        this.approvalTime = approvalTime;
    }

    public int getApproverId() {
        return approverId;
    }

    public void setApproverId(int approverId) {
        this.approverId = approverId;
    }

    public String getApproverName() {
        return approverName;
    }

    public void setApproverName(String approverName) {
        this.approverName = approverName;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public HashMap<Integer, String> getSteps() {
        return steps;
    }

    public void setSteps(HashMap<Integer, String> steps) {
        this.steps = steps;
    }

    public HashMap<String, String> getIngredients() {
        return ingredients;
    }

    public void setIngredients(HashMap<String, String> ingredients) {
        this.ingredients = ingredients;
    }

    public ArrayList<String> getTools() {
        return tools;
    }

    public void setTools(ArrayList<String> tools) {
        this.tools = tools;
    }

    public int getCookTime() {
        return cookTime;
    }

    public void setCookTime(int cookTime) {
        this.cookTime = cookTime;
    }

    public int getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(int voteCount) {
        this.voteCount = voteCount;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getAuthorAvatarUrl() {
        return authorAvatarUrl;
    }

    public void setAuthorAvatarUrl(String authorAvatarUrl) {
        this.authorAvatarUrl = authorAvatarUrl;
    }

    public ArrayList<Comment> getComments() {
        return comments;
    }

    public void setComments(ArrayList<Comment> comments) {
        this.comments = comments;
    }

    public Date getRestrictionTime() {
        return restrictionTime;
    }

    public void setRestrictionTime(Date restrictionTime) {
        this.restrictionTime = restrictionTime;
    }

    public String getRestrictionReason() {
        return restrictionReason;
    }

    public void setRestrictionReason(String restrictionReason) {
        this.restrictionReason = restrictionReason;
    }

    
    
    
    
    
}
