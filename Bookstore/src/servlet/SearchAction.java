package servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import solr.solrSearch;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import entity.Book;

/**
 * Servlet implementation class SearchAction
 */
@WebServlet("/SearchAction")
public class SearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAction() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//this.doGet(request, response);
		
		 final String URL="http://localhost:8983/solr/core/";
		 HttpSolrServer solrServer=new HttpSolrServer(URL);
		 String searchname=(String)request.getParameter("searchName");
		 String parame=new String(request.getParameter("searchName").getBytes("ISO-8859-1"),"UTF-8");
		 parame="name:"+searchname;//parame="*:*";
		 	
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
		
		request.setAttribute("searchlist", list);
		request.getRequestDispatcher("/showResult.jsp").forward(request, response);
		System.out.println("using SearchAction servlet");
		
	}

}
