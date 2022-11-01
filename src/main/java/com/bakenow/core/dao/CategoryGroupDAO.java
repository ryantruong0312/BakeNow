/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.core.model.CategoryGroup;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.sql.DataSource;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class CategoryGroupDAO implements DAO<CategoryGroup> {

    private final DataSource dataSource;

    public CategoryGroupDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public boolean add(CategoryGroup... t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<CategoryGroup> getAll() throws NamingException {
        List<CategoryGroup> result = new ArrayList<>();
        String query = "SELECT * "
                + "FROM [dbo].CategoryGroup";

//        Context initContext = new InitialContext();
//        Context ctx = (Context) initContext.lookup("java:comp/env");
//        DataSource dataSource = (DataSource) ctx.lookup("jdbc/AzureSQLDB");
        try ( Connection conn = dataSource.getConnection();  PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("groupId");
                String name = rs.getString("groupName");
                result.add(new CategoryGroup(id, name));
            }
        } catch (SQLException //                |ClassNotFoundException 
                ex) {
            //TODO: impl. catch
            System.out.println(ex.getMessage());
        }
        return result;
    }

    @Override
    public <Integer> Optional getById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<CategoryGroup> getByParentId(String pId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<CategoryGroup> getSortedByTime(Timestamp datetime) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<CategoryGroup> getByStatus(int status) {
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
