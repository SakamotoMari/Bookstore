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
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.apache.solr.common.params.ModifiableSolrParams;
import org.apache.solr.common.params.SolrParams;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import entity.Book;
public class SolrTest {

	private SolrServer server;
    private HttpSolrServer httpServer;
    
    private static final String DEFAULT_URL = "http://localhost:8983/solr/";
    
    @Before
    public void init() {
        try {
            server = new HttpSolrServer(DEFAULT_URL);
            httpServer = new HttpSolrServer(DEFAULT_URL);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @After
    public void destory() {
        server = null;
        httpServer = null;
        System.runFinalization();
        System.gc();
    }
    
    public final void fail(Object o) {
        System.out.println(o);
    }
    
    /**
     * <b>function:</b> 测试是否创建server对象成功
     */
    @Test
    public void server() {
        fail(server);
        fail(httpServer);
    }
 
    /**
     * <b>function:</b> 根据query参数查询索引
     */
    public void query(String query) {
        SolrParams params = new SolrQuery(query);
        
        try {
            QueryResponse response = server.query(params);
            
            SolrDocumentList list = response.getResults();
            for (int i = 0; i < list.size(); i++) {
                fail(list.get(i));
            }
        } catch (SolrServerException e) {
            e.printStackTrace();
        } 
    }
}
