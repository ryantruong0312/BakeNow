/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.bakenow.core.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author Admin
 * @param <T>
 */
public interface DAO<T> {

    public boolean add(T... t);

    public List<?> getAll() throws Exception;

    public <T> Optional<?> getById(T id);

    public List<?> getByParentId(String pId);

    public List<?> getSortedByTime(Timestamp datetime);
//    java.util.Date date = new Date();
//    Object param = new java.sql.Timestamp(date.getTime());

    public List<?> getByStatus(int status);

    public boolean update(String... cellValue);

    public boolean delete(String id);

}
