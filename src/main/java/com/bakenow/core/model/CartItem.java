/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.util.Objects;

/**
 *
 * @author Admin
 */
public class CartItem {

    private Product product;
    private Integer quantity;

    public CartItem() {
    }

    public CartItem(Product product, Integer quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object that) {
        if (that == this) return true;
        if (!(that instanceof CartItem)) return false;
        CartItem ci = (CartItem) that;
        if (ci.product == null) {
            return this.product == null;
        }
        return ci.product.equals(this.product)
                && Objects.equals(ci.quantity, this.quantity);
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 37 * hash + Objects.hashCode(this.product);
        hash = 37 * hash + Objects.hashCode(this.quantity);
        return hash;
    }

}
