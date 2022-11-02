/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Product {

    private int id;
    private int categoryId;
    private int shopId;
    private Date createTime;
    private Date approveTime;
    private String name;
    private String description;
    private double price;
    private int stock;
    private double rating;
    private int reviewCount;
    private int statusId;

    private Product() {
    }
    
    public Product(int id, String name, double price, double rating, int reviewCount){
        this.id = id;
        this.name = name;
        this.price = price;
        this.rating = rating;
        this.reviewCount = reviewCount;
    }

    public Product(int id, int categoryId, int shopId, Date createTime, Date approveTime, String name, String description, double price, int stock, double rating, int reviewCount, int statusId) {
        this.id = id;
        this.categoryId = categoryId;
        this.shopId = shopId;
        this.createTime = createTime;
        this.approveTime = approveTime;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.rating = rating;
        this.reviewCount = reviewCount;
        this.statusId = statusId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getApproveTime() {
        return approveTime;
    }

    public void setApproveTime(Date approveTime) {
        this.approveTime = approveTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
    
    

}
