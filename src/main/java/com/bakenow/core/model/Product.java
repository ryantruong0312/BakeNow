/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.sql.Timestamp;
import java.util.Objects;

/**
 *
 * @author Admin
 */
public class Product {

    private Integer id;
    private Integer categoryId;
    private Integer shopId;
    private Timestamp createTime;
    private Timestamp approveTime;
    private String name;
    private String description;
    private Double price;
    private Integer stock;
    private Double rating;
    private Boolean available;
    private Byte statusId;

    private Product() {
    }
    
    public Product(Integer id) {
        this.id = id;
    }

    public Product(Integer id, Integer categoryId, Integer shopId, Timestamp creationTime, Timestamp approvalTime, String name, String description, Double price, Integer stock, Double rating, Boolean available, Byte statusId) {
        this.id = id;
        this.categoryId = categoryId;
        this.shopId = shopId;
        this.createTime = creationTime;
        this.approveTime = approvalTime;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.rating = rating;
        this.available = available;
        this.statusId = statusId;
    }
    
    public static Product aProduct() {
        return new Product();
    }
    
    public Product withId(Integer id) {
        this.id = id;
        return this;
    }
    
    public Product withPrice(Double price) {
        this.price = price;
        return this;
    }
        
    //TODO: Finish Builder pattern

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Timestamp getCreationTime() {
        return createTime;
    }

    public void setCreationTime(Timestamp creationTime) {
        this.createTime = creationTime;
    }

    public Timestamp getApprovalTime() {
        return approveTime;
    }

    public void setApprovalTime(Timestamp approvalTime) {
        this.approveTime = approvalTime;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public Byte getStatusId() {
        return statusId;
    }

    public void setStatusId(Byte statusId) {
        this.statusId = statusId;
    }

    /**
     *
     * @param that
     * @return
     */
    @Override
    public boolean equals(Object that) {
        if (that == this) return true;
        if (!(that instanceof Product)) return false;
        Product p = (Product) that;
        return Objects.equals(p.id, this.id);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + Objects.hashCode(this.id);
        return hash;
    }

}
