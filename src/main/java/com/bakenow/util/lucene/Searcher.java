/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bakenow.util.lucene;

import java.io.IOException;
import java.nio.file.Path;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.FSDirectory;

/**
 *
 * @author Admin
 */
public class Searcher {

    private static final int NUM_HITS = 12;
    private static final int HITS_THRESHOLD = 96;

    private Analyzer analyzer = new StandardAnalyzer();

    private IndexReader reader;
    private IndexSearcher searcher;
    private TopScoreDocCollector collector;

//    Searcher() {
//    }
    Searcher(String location) throws IOException {
        this.reader = DirectoryReader.open(FSDirectory.open(Path.of(location)));
        this.searcher = new IndexSearcher(this.reader);
        this.collector = TopScoreDocCollector.create(NUM_HITS, HITS_THRESHOLD);
    }

    public void search(String searchTerms, String field) {
        try {
            QueryParser qp = new QueryParser(field, analyzer);
            Query q = qp.parse(searchTerms);

            searcher.search(q, collector);
            ScoreDoc[] hits = collector.topDocs().scoreDocs;

            System.out.println("Found " + hits.length + " hits.");
            for (int i = 0; i < hits.length; ++i) {
                int docId = hits[i].doc;
                Document d = searcher.doc(docId);
                System.out.println((i + 1) + ". " + d.get("path") + " score=" + hits[i].score);
            }
        } catch (Exception e) {
            System.out.println("Error searching " + searchTerms + " : " + e.getMessage());
        }
    }

}
