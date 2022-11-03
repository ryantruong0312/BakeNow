/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.dao;

import com.bakenow.core.model.CategoryGroup;
import com.bakenow.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductCategoryDAO {
    public static final String GET_CATEGORY ="select id,name from ProductCategory where parentId = ?";
    
    //get all category except for the bigest one (id 1 and 2)
    public List<CategoryGroup> getAllOfABigCategory(int categoryid) throws SQLException{
        List<CategoryGroup> listCategory = new ArrayList<>();
        List<CategoryGroup> listCategory_Pacific = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY);
                ptm.setInt(1, 1);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    listCategory.add(new CategoryGroup(id, name));
                    for (CategoryGroup categoryGroup : listCategory) {
                        int temp = categoryGroup.getId();
                        ptm.setInt(1,temp );
                        rs= ptm.executeQuery();
                        while (rs.next()) {                            
                            int idPacific = rs.getInt("id");
                            String namePacific = rs.getString("name");
                            listCategory_Pacific.add(new CategoryGroup(idPacific,namePacific));
                        }
                    }
                }
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
        return listCategory;
    }
}
// lam sao cho tot nhi select cai to nhat a ??
// hay select cai 
