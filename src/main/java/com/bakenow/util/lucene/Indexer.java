/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.util.lucene;

import java.io.IOException;

/**
 *
 * @author Admin
 */
public interface Indexer {

    public void indexFileOrDirectory(String fileName) throws IOException;

    public void closeIndex() throws IOException;

    public void updateFile(String fileName) throws IOException;
}
