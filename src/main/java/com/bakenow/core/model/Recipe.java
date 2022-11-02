/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.util.ArrayList;
import java.util.Date;

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
    private ArrayList<String> steps;
    private ArrayList<Ingredient> ingredients;
    private ArrayList<String> tools;
    private int cookTime;
    private double rating;
    private int ratingCount;
    private int statusId;

    public Recipe() {
    }

    public Recipe(int id, int authorId, String authorName, Date createTime, Date approvalTime, int approverId, String approverName, String imgUrl, String title, String desc, ArrayList<String> steps, ArrayList<Ingredient> ingredients, ArrayList<String> tools, int cookTime, double rating, int ratingCount, int statusId) {
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
        this.rating = rating;
        this.ratingCount = ratingCount;
        this.statusId = statusId;
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

    public ArrayList<String> getSteps() {
        return steps;
    }

    public void setSteps(ArrayList<String> steps) {
        this.steps = steps;
    }

    public ArrayList<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(ArrayList<Ingredient> ingredients) {
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

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(int ratingCount) {
        this.ratingCount = ratingCount;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
    
    
}
