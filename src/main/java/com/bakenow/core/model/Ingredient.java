/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

/**
 *
 * @author tlminh
 */
public class Ingredient {
    private int productCategoryId;
    private String alias;
    private String amount;

    public Ingredient() {
    }

    public Ingredient(int productCategoryId, String alias, String amount) {
        this.productCategoryId = productCategoryId;
        this.alias = alias;
        this.amount = amount;
    }

    public int getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(int productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    
    
}
