/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.util.lucene;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;

/**
 *
 * @author Admin
 */
public class TextFileIndexer implements Indexer {

    private IndexWriterConfig config;
    private IndexWriter indexWriter;

    private final List<File> queue = new ArrayList();

//    TextFileIndexer() {
//    }
    TextFileIndexer(Analyzer analyzer, Directory directory) throws IOException {
        this.config = new IndexWriterConfig(analyzer);
        this.indexWriter = new IndexWriter(directory, config);
    }

    void changeAnalyzer(Analyzer analyzer) throws IOException {
        this.config = new IndexWriterConfig(analyzer);
        this.indexWriter = new IndexWriter(this.indexWriter.getDirectory(), config);
    }

    void changeDirectory(Directory directory) throws IOException {
        this.indexWriter = new IndexWriter(directory, config);
    }

    /**
     * Indexes a file or directory
     *
     * @param fileName the name of a text file or a folder we wish to add to the
     * index
     * @throws java.io.IOException
     */
    @Override
    public void indexFileOrDirectory(String fileName) throws IOException {
        //===================================================
        //gets the list of files in a folder (if user has submitted
        //the name of a folder) or gets a single file name (is user
        //has submitted only the file name)
        //===================================================
        addFiles(new File(fileName));

        int originalNumDocs = indexWriter.getDocStats().numDocs;
        for (File f : queue) {
            FileReader fr = null;
            try {
                Document doc = new Document();

                //===================================================
                // add contents of file
                //===================================================
                fr = new FileReader(f);
                doc.add(new TextField("contents", fr));
                doc.add(new StringField("path", f.getPath(), Field.Store.YES));
                doc.add(new StringField("filename", f.getName(), Field.Store.YES));

                indexWriter.addDocument(doc);
                System.out.println("Added: " + f);
            } catch (Exception e) {
                System.out.println("Could not add: " + f);
            } finally {
                fr.close();
            }
        }

        int newNumDocs = indexWriter.getDocStats().numDocs;
        System.out.println("");
        System.out.println("************************");
        System.out.println((newNumDocs - originalNumDocs) + " documents added.");
        System.out.println("************************");

        queue.clear();
    }

    private void addFiles(File file) {

        if (!file.exists()) {
            System.out.println(file + " does not exist.");
        }
        if (file.isDirectory()) {
            for (File f : file.listFiles()) {
                addFiles(f);
            }
        } else {
            String filename = file.getName();
            String normalizedFilename = filename.toLowerCase();
            //===================================================
            // Only index text files
            //===================================================
            if (normalizedFilename.endsWith(".htm") || normalizedFilename.endsWith(".html")
                    || normalizedFilename.endsWith(".xml") || normalizedFilename.endsWith(".txt")) {
                queue.add(file);
            } else {
                System.out.println("Skipped " + filename);
            }
        }
    }

    /**
     * Close the index.
     *
     * @throws java.io.IOException when exception closing
     */
    public void closeIndex() throws IOException {
        indexWriter.close();
    }

    @Override
    public void updateFile(String fileName) throws IOException {
        
    }
}
