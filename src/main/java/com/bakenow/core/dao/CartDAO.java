/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import static com.bakenow.core.model.Cart.*;
import static com.bakenow.core.model.CartItem.*;
import static com.bakenow.core.model.Product.*;

import com.bakenow.core.model.Cart;
import com.bakenow.core.model.CartItem;
import com.bakenow.core.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class CartDAO implements DAO<Cart> {

    private DataSource dataSource;

    public CartDAO(DataSource datasource) {
        this.dataSource = datasource;
    }

    @Override
    public boolean add(Cart... t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Cart> getAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public <T> Optional<Cart> getById(T id) {
        String queryCart = "SELECT * "
                + "FROM [dbo].[Cart] "
                + "WHERE ([userId]=? OR [sessionId]=?)";
        String queryCartItem = "SELECT * "
                + "FROM [dbo].[CartItem] c "
                + "JOIN [dbo[.[Product] p ON c.[productId]=p.[id]"
                + "WHERE [cartId]=?";

        Cart cart = null;
        int cartId = -1;
        try ( Connection conn = dataSource.getConnection()) {
            try ( PreparedStatement stmt = conn.prepareStatement(queryCart)) {
                stmt.setString(1, (String) id);
                stmt.setString(2, (String) id);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    cartId = rs.getInt("cartId");
                    String sessionId = rs.getString("sessionId");
                    String useId = rs.getString("useId");
                    double total = rs.getDouble("total");
                    cart = aCart().withCartItems(new HashMap<Integer, CartItem>()).withSessionId(sessionId).withUserId(useId).withTotal(total);
                }
            }
            if (cart != null) {
                try ( PreparedStatement stmt = conn.prepareStatement(queryCartItem)) {
                    stmt.setInt(1, cartId);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        String productId = rs.getString("productId");
                        //Product's attr'es here
                        Product product = aProduct();
                        CartItem cartItem = new CartItem(product, cartId);
                        cart.add(cartItem);
                    }
                }
            }
        } catch (SQLException //                |ClassNotFoundException 
                ex) {
            //TODO: impl. catch
            System.out.println(ex.getMessage());
        }
        return Optional.ofNullable(cart);
    }

    @Override
    public List<Cart> getByParentId(String pId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Cart> getSortedByTime(Timestamp datetime) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Cart> getByStatus(int status) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(String... cellValue) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
