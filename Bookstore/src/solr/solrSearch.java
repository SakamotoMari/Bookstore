package solr;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.apache.solr.common.params.ModifiableSolrParams;
import org.apache.solr.common.params.SolrParams;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import entity.Book;

public class solrSearch {
	private static final String URL="http://localhost:8983/solr/core/";
    SolrServer solrServer=new HttpSolrServer(URL);
   /* public solrSearch(){
	}*/
     
	public List search(String parame){
	 List list=new ArrayList();
	 try{
			
		 SolrQuery query=new SolrQuery();
		 query.setQuery(parame);
		 QueryResponse rsp=solrServer.query(query);
		 query.setHighlight(true);
		 SolrDocumentList docs=rsp.getResults();
		 System.out.println("文档个数："+docs.getNumFound());
		 System.out.println("查询时间："+rsp.getQTime());
		 if(docs.size()==0){
			 System.out.println("查询对象为空");
			 
		 }else{
			 for(SolrDocument doc:docs){
				 Book book=new Book();
				 String id=(String)doc.getFieldValue("id");
				 String name=(String)doc.getFieldValue("name");
				 int booktype=(int)doc.getFieldValue("booktype");
				 String author=(String)doc.getFieldValue("author");
				 String press=(String)doc.getFieldValue("press");
				 double price=(double)doc.getFieldValue("price");
				 int amount=(int)doc.getFieldValue("amount");
				 query.addHighlightField(name);
				 query.setHighlightSimplePre("<font color=\"red\">"+id);
				 query.setHighlightSimplePre("</font>");
				 book.setId(id);
				 book.setName(name);
				 book.setBookType(booktype);
				 book.setAuthor(author);
				 book.setPress(press);
				 book.setPrice(price);
				 book.setAmount(amount);
				 System.out.println(id);
				 System.out.println(name);
				 System.out.println(author);
				 System.out.println(press);
				 System.out.println(price);
				 System.out.println(amount);
				 list.add(book);
				 
			 }
		 }		 
	 }catch(SolrServerException e){
		 e.printStackTrace();
	 }
	 return list; 
 }
	
	public static void main(String[] args){
	    solrSearch test=new solrSearch();
		 String parame=new String("爱你就像爱生命");
		 parame="name:爱你就像爱生命";
		List list=test.search(parame);

	}
	
}
