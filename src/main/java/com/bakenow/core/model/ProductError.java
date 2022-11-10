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
public class ProductError {
    private String name;
    private String mnfDate;
    private String category;   
    private String price;
    private String stock;
    private String origin;

    public ProductError() {
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMnfDate(String mnfDate) {
        this.mnfDate = mnfDate;
    }



    public void setPrice(String price) {
        this.price = price;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }


    public String getName() {
        return name;
    }

    public String getMnfDate() {
        return mnfDate;
    }

    public void setCategory(String category) {
        this.category = category;
    }

   

    public String getCategory() {
        return category;
    }

    public String getPrice() {
        return price;
    }

  

    public String getStock() {
        return stock;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }


    
}
