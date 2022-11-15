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
    public static final String GET_CATEGORY = "select id,name from ProductCategory where parentId = ?";
    public static final String GET_CATEGORY_BY_ID = "select id,name from ProductCategory where id = ?";
    public static final String GET_CATEGORY_ID_BY_NAME = "select id from ProductCategory where name like ?";

    //get all category except for the bigest one (id 1 and 2)
    public List<CategoryGroup> getAllOfABigCategory(int categoryid) throws SQLException {
        List<CategoryGroup> IlistCategory = new ArrayList<>();
        List<CategoryGroup> IlistCategory_Pacific = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY);
                // vòng for lấy id của 2 cái to nhất đầu tiên luôn đúng vì scope
                //hiện tại có tool với lại inger thôi
                // các bước lấy trước tiên lấy hết tất cả list  có parent id là 1
                // thêm vào trong list 
                // từ cái list Ingre với pid = 1 
                // thêm vào trong từng cái item trong list Ingre 1 cái chứa các giá trị nhỏ hơn 

                ptm.setInt(1, categoryid);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    IlistCategory.add(new CategoryGroup(id, name));// tới đây lấy được tất cả tag to nhất
                    // của ingre
                }
                // ở đây lỗi vì cái list nó đâu thật sự chứa list đâu
                for (CategoryGroup categoryGroup : IlistCategory) {
                    int temp = categoryGroup.getId();//lấy được id của parent category
                    ptm.setInt(1, temp);
                    rs = ptm.executeQuery();//chạy query để lấy smaller category
                    while (rs.next()) {
                        int idPacific = rs.getInt("id");
                        String namePacific = rs.getString("name");
                        categoryGroup.getSmallerCatgory().add(new CategoryGroup(idPacific, namePacific));// add gì vào đây
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
        return IlistCategory;
    }
    
    public CategoryGroup getCategoryById(String categoryId) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY_BY_ID);
                ptm.setString(1, categoryId);
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    return new CategoryGroup(id,name); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            if (rs != null) {
//                ptm = conn.prepareStatement(NUMBER_OF_ALL_PRODUCT);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    this.numberOfProduct = rs.getInt("ROW_COUNT");
//                }
//                rs.close();
//            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
       return null;
    }
    public int getCategoryIdByName(String categoryName) throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY_ID_BY_NAME);
                ptm.setString(1, "%"+categoryName.trim()+"%");
//                ptm.setInt(2, noOfProducts);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    return id; 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            if (rs != null) {
//                ptm = conn.prepareStatement(NUMBER_OF_ALL_PRODUCT);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    this.numberOfProduct = rs.getInt("ROW_COUNT");
//                }
//                rs.close();
//            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }
    
    
}
// lam sao cho tot nhi select cai to nhat a ??
// hay select cai 
