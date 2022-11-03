/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.util.DBUtils;
import com.bakenow.core.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author tlminh
 */
public class UserDAO {
    private static final String LOGIN = "SELECT id, displayName, dob, email, phone, address, roleId, createTime, avatarUrl FROM [User] "
            + " WHERE username=? AND password=?";
    
    public User checkLogin(String username, String password) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String displayName = rs.getString("displayName");
                    System.out.println(displayName);
                    Date dob = rs.getDate("dob");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    int roleId = rs.getInt("roleId");
                    Date createTime = rs.getDate("createTime");
                    String avatarUrl = rs.getString("avatarUrl");
                    user = new User(id, username, password, displayName, dob, email, phone, address, roleId, phone, createTime, avatarUrl);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
}
