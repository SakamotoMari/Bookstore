package solr;
import java.util.ArrayList;
import java.util.Collection;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
public class SolrjDocument {
     private static final String URL="http://localhost:8983/solr/core/";
     SolrServer server=null;
     
     //使用SolrJ创建索引
     public void addDoc(){
    	 try{
    		  server=getSolrServer();
    		  Collection docs=new ArrayList();
    		  server.deleteByQuery("*:*");
    		  SolrInputDocument doc1=new SolrInputDocument();
    		  doc1.addField("id", "WX009");
    		  doc1.addField("booktype", 0);
    		  doc1.addField("name", "蛤蟆的油");
    		  doc1.addField("author", "黑泽明");
    		  doc1.addField("press","文学出版社");
    		  doc1.addField("price", 27);
    		  doc1.addField("amount", 10);
    		  
    		  docs.add(doc1);
    		  server.add(docs);
    		  server.commit();
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 
     }
     //查询服务器
     public void getQuery(){
    	 try{
    		 SolrServer server=getSolrServer();
    		 SolrQuery query=new SolrQuery();
    		 query.setQuery("*:*");
    		 QueryResponse results=server.query(query);
    		 SolrDocumentList docs=results.getResults();
    		 System.out.println("the size of docs is "+docs.size());
    		 for(int i=0;i<docs.size();i++){
    			 SolrDocument doc=docs.get(i);
    			 System.out.println(doc.getFieldValue("name"));
    			 System.out.println(doc.getFieldValue("author"));
    			
    		 }
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
     }
     public SolrServer getSolrServer(){
    	 try{
    		 return new HttpSolrServer(URL);
    	 }catch(Exception e){
    		 return null;
    	 }
     }
     public static void main(String[] args){
    	 SolrjDocument docsolr=new SolrjDocument();
    	 docsolr.addDoc();
    	 docsolr.getQuery();
     }
}
