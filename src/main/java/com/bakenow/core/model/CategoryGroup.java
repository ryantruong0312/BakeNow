/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.core.model;

import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryGroup {
    private int id;
    private String name;
    private int parentId; 
    private List<CategoryGroup> smallerCatgory; 

    public CategoryGroup() {
    }

    public CategoryGroup(int id, String name, List<CategoryGroup> smallerCatgory) {
        this.id = id;
        this.name = name;
        this.smallerCatgory = smallerCatgory;
    }

    public void setSmallerCatgory(List<CategoryGroup> smallerCatgory) {
        this.smallerCatgory = smallerCatgory;
    }

    public List<CategoryGroup> getSmallerCatgory() {
        return smallerCatgory;
    }

    public CategoryGroup(int id, String name, int parentId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
    }

    public CategoryGroup(int id, String name) {
        this.id = id;
        this.name = name;
        this.smallerCatgory = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

}
