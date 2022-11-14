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
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author tlminh
 */
public class UserDAO {
    private static final String LOGIN = "SELECT id, displayName, bio, dob, email, phone, address, roleId, createTime, avatarUrl FROM [User] "
            + " WHERE username=? AND password=?";
    private static final String CHECK_DUPLICATE = "SELECT id FROM [User] WHERE username = ?";
    private static final String INSERT_USER = "INSERT INTO [User](username, displayname, password, roleId, createTime) VALUES(?,?,?,?,?)";
    private static final String GET_DISPLAY_NAME_BY_ID = "SELECT displayName FROM [User] WHERE id = ?";
    private static final String GET_AVATAR_URL_BY_ID = "SELECT avatarUrl FROM [User] WHERE id = ?";
    
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
                ptm.setTimestamp(5, new Timestamp(new Date().getTime()));
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
    
    public String getDisplayNameById(int id) throws SQLException {
        String name = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DISPLAY_NAME_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    name = rs.getString("displayName");
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
        return name;
    }
    //Get avatar url of an account by providing user id
    public String getAvatarUrlOfUserById(int id) throws SQLException {
        String url = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_AVATAR_URL_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    url = rs.getString("avatarUrl");
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
        return url;
    }
    
}
