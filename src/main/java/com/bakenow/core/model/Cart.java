/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author tlminh
 */
public class Cart {

    private Map<Integer, OrderItem> cart;

    public Cart() {
    }

    public Cart(Map<Integer, OrderItem> cart) {
        this.cart = cart;
    }

    public Map<Integer, OrderItem> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, OrderItem> cart) {
        this.cart = cart;
    }

    public boolean addToCart(OrderItem item) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
            this.cart.put(item.getId(), new OrderItem());
        }
        if (this.cart.containsKey(item.getId())) {
            int currentQuantity = (this.cart.get(item.getId()).getOrderQuantity());
            item.setOrderQuantity(currentQuantity + item.getOrderQuantity());
        }
        this.cart.put(item.getId(), item);
        check = true;
        return check;
    }

    public boolean remove(int itemId) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(itemId)) {
                this.cart.remove(itemId);
                check = true;
            }
        }
        return check;
    }

    public boolean update(int itemId, OrderItem item) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(itemId)) {
                this.cart.replace(itemId, item);
                check = true;
            }
        }
        return check;
    }
}


