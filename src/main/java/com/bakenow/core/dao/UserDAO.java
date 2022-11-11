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
import java.sql.Date;

/**
 *
 * @author tlminh
 */
public class UserDAO {
    private static final String LOGIN = "SELECT id, displayName, bio, dob, email, phone, address, roleId, createTime, avatarUrl FROM [User] "
            + " WHERE username=? AND password=?";
    private static final String CHECK_DUPLICATE = "SELECT id FROM [User] WHERE username = ?";
    private static final String INSERT_USER = "INSERT INTO [User](username, displayname, password, roleId, createTime) VALUES(?,?,?,?,?)";
    private static final String GET_USER = "SELECT displayName, bio, dob, email, phone, address, roleId, createTime, avatarUrl FROM [User] WHERE id = ?";
    private static final String UPDATE_USER = "UPDATE [User] SET displayName = ?, bio = ?, dob = ?, email = ?, phone = ?, address = ?, avatarUrl = ? WHERE id = ?";
    
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
                    String bio = rs.getString("bio");
                    Date dob = rs.getDate("dob");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    int roleId = rs.getInt("roleId");
                    Date createTime = rs.getDate("createTime");
                    String avatarUrl = rs.getString("avatarUrl");
                    user = new User(id, username, password, displayName, dob, email, phone, address, roleId, bio, createTime, avatarUrl);
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
    
    public boolean checkDuplicate(String username) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    public boolean insertUser(String username, String password, int roleId) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_USER);
                ptm.setString(1, username);
                ptm.setString(2, username);
                ptm.setString(3, password);
                ptm.setInt(4, 3);
                ptm.setDate(5, Date.valueOf(java.time.LocalDate.now()));
                check = ptm.executeUpdate()> 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    public User getUserById(int userId) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER);
                ptm.setInt(1, userId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String displayName = rs.getString("displayName");
                    String bio = rs.getString("bio");
                    Date dob = rs.getDate("dob");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    int roleId = rs.getInt("roleId");
                    Date createTime = rs.getDate("createTime");
                    String avatarUrl = rs.getString("avatarUrl");
                    user = new User(userId, "", "", displayName, dob, email, phone, address, roleId, bio, createTime, avatarUrl);
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

    public boolean updateRecipe(int userId, String displayName, String bio, String phone, Date dob, String email, String address, String avatarUrl) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_USER);
                ptm.setString(1, displayName);
                ptm.setString(2, bio);
                ptm.setDate(3, dob);
                ptm.setString(4, email);
                ptm.setString(5, phone);
                ptm.setString(6, address);
                ptm.setString(7, avatarUrl);
                ptm.setInt(8, userId);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
