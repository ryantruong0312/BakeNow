/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author Admin
 */
//BUG: Since ORM is not implemented, if Product's price changes, product.getPrice()
//becomes stale
public class Cart {

    private Map<Integer, CartItem> cartItems;   //key: productId
    private String sessionId;
    private String userId;
    private double total;

    public Cart() {
        this.cartItems = new ConcurrentHashMap<>();
    }

    public Cart(Map<Integer, CartItem> cartItems, String sessionId, String userId, double total) {
        this.cartItems = new ConcurrentHashMap<>(cartItems);
        this.sessionId = sessionId;
        this.userId = userId;
        this.total = total;
    }

    public static Cart aCart() {
        return new Cart();
    }

    public Cart withCartItems(Map<Integer, CartItem> cartItems) {
        this.cartItems.putAll(cartItems);
        return this;
    }

    public Cart withCartItem(CartItem cartItem) {
        this.cartItems.put(cartItem.getProduct().getId(), cartItem);
        return this;
    }

    public Cart withSessionId(String sessionId) {
        this.sessionId = sessionId;
        return this;
    }

    public Cart withUserId(String userId) {
        this.userId = userId;
        return this;
    }

    public Cart withTotal(double total) {
        this.total = total;
        return this;
    }

    private boolean containsItem(CartItem cartItem) {
        return cartItem != null && this.cartItems.containsKey(cartItem.getProduct().getId());
    }

    private CartItem get(Integer productId) {
        return this.cartItems.get(productId);
    }

    private CartItem get(Product product) {
        return this.cartItems.get(product.getId());
    }

    private CartItem get(CartItem cartItem) {
        return this.cartItems.get(cartItem.getProduct().getId());
    }

    private Integer getIdOf(CartItem cartItem) {
        return cartItem.getProduct().getId();
    }

    public void add(CartItem cartItem) {
        if (cartItem == null) {
            throw new NullPointerException("Cart item must not be null.");
        }
        if (cartItem.getQuantity() <= 0) {
            throw new IllegalArgumentException("Quantity must be a positive integer.");
        }

        int addedQty = cartItem.getQuantity();
        if (this.containsItem(cartItem)) {
            int curQty = this.get(cartItem).getQuantity();
            cartItem.setQuantity(curQty + addedQty);
        }
        cartItems.put(getIdOf(cartItem), cartItem);
        total += cartItem.getProduct().getPrice() * addedQty;
    }

    public boolean update(CartItem cartItem) {
        if (cartItem == null) throw new NullPointerException("Cart item must not be null.");
        if (cartItem.getQuantity() <= 0) return this.remove(cartItem);
        if (this.containsItem(cartItem)) {
            int oldQty = this.get(cartItem).getQuantity();
            cartItems.replace(getIdOf(cartItem), cartItem);
            total += cartItem.getProduct().getPrice() * (cartItem.getQuantity() - oldQty);
            return true;
        }
        return false;
    }

    public boolean remove(CartItem cartItem) {
        if (cartItem == null) throw new NullPointerException("Cart item must not be null.");
        if (this.containsItem(cartItem)) {
            int oldQty = this.get(cartItem).getQuantity();
            this.cartItems.remove(getIdOf(cartItem));
            this.total -= cartItem.getProduct().getPrice() * oldQty;
            return true;
        }
        return false;
    }

    public void add(Product product, int quantity) {
        CartItem cartItem = new CartItem(product, quantity);
        this.add(cartItem);
    }

    public boolean update(Product product, int quantity) {
        CartItem toBeCartItem = new CartItem(product, quantity);
        return this.update(toBeCartItem);
    }

    public boolean remove(Product product, int quantity) {
        CartItem cartItem = new CartItem(product, quantity);
        return this.remove(cartItem);
    }

    public Map<Integer, CartItem> show() {
        return cartItems;
    }

    public Map<Integer, CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(Map<Integer, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public boolean equals(Object that) {
        if (that == this) return true;
        if (!(that instanceof Cart)) return false;
        Cart c = (Cart) that;
        if (c.cartItems == null) {
            return this.cartItems == null;
        }
        new ConcurrentHashMap<>().equals(that);
        return c.cartItems.equals(this.cartItems);
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 17 * hash + Objects.hashCode(this.cartItems);
        return hash;
    }

}
