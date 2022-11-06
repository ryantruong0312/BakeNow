/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

/**
 *
 * @author Admin
 */
public class Shop {
    private int id;
    private int ownerId;
    private String name;
    private String avatarUrl;
    private String description;
    private double rating;
    private int ratingCount;
    private int productCount;
    private String email;
    private String phone;
    private String address;

    public Shop(int id, int ownerId, String name, String avatarUrl, String description, double rating, int ratingCount, int productCount, String email, String phone, String address) {
        this.id = id;
        this.ownerId = ownerId;
        this.name = name;
        this.avatarUrl = avatarUrl;
        this.description = description;
        this.rating = rating;
        this.ratingCount = ratingCount;
        this.productCount = productCount;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Shop other = (Shop) obj;
        return this.id == other.id;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void setRatingCount(int ratingCount) {
        this.ratingCount = ratingCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public Shop() {
    }

    public int getId() {
        return id;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public String getName() {
        return name;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public String getDescription() {
        return description;
    }

    public double getRating() {
        return rating;
    }

    public int getRatingCount() {
        return ratingCount;
    }

    public int getProductCount() {
        return productCount;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }
    
           
    
}
