/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Admin
 */
public class Product {

    private int id;
    private int shopId;
    private int categoryId;
    private Date createTime;
    private Date approveTime;
    private int approverID;
    private String imgUrl;
    private String name;
    private String origin;
    private Date mnfDate;
    private Date expDate;   
    private String description;
    private double price;
    private int stock;
    private double rating;
    private int reviewCount;
    private int statusId;

    private Product() {
    }

    public void setApproverID(int approverID) {
        this.approverID = approverID;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public void setMnfDate(Date mnfDate) {
        this.mnfDate = mnfDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public int getApproverID() {
        return approverID;
    }

    public String getOrigin() {
        return origin;
    }

    public Date getMnfDate() {
        return mnfDate;
    }

    public Date getExpDate() {
        return expDate;
    }

    public Product(int id, int shopId, int categoryId, String imgUrl, String name, String origin, Date mnfDate, Date expDate, String description, double price, int stock, double rating, int reviewCount) {
        this.id = id;
        this.shopId = shopId;
        this.categoryId = categoryId;
        this.imgUrl = imgUrl;
        this.name = name;
        this.origin = origin;
        this.mnfDate = mnfDate;
        this.expDate = expDate;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.rating = rating;
        this.reviewCount = reviewCount;
    }

    public Product(int id, int shopId, String name, String imgUrl, double price, double rating, int reviewCount) {
        this.id = id;
        this.shopId = shopId;
        this.name = name;
        this.imgUrl = imgUrl;
        this.price = price;
        this.rating = rating;
        this.reviewCount = reviewCount;
    }
    
    public Product(int id, String name, double price, double rating, int reviewCount){
        this.id = id;
        this.name = name;
        this.price = price;
        this.rating = rating;
        this.reviewCount = reviewCount;
    }

    public Product(int id, String name, String imgUrl, double price, double rating, int reviewCount) {
        this.id = id;
        this.name = name;
        this.imgUrl = imgUrl;
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

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public boolean checkimgUrl(){
        boolean check = this.imgUrl.contains("\\assets\\img");
           return check;
    }
    public String getImgName(){
        try {
            int index = this.imgUrl.indexOf('/');
            String after =this.imgUrl.substring(index+1);
            return after;
        } catch (Exception e) {
        }
        return null;
    }
}
