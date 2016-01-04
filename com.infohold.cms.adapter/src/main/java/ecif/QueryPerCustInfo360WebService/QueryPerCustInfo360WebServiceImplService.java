package ecif.QueryPerCustInfo360WebService;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * This class was generated by Apache CXF 2.7.4
 * 2015-08-19T11:16:37.870+08:00
 * Generated source version: 2.7.4
 * 
 */
@WebServiceClient(name = "QueryPerCustInfo360WebServiceImplService", 
                  wsdlLocation = "file:wsdl/QueryPerCustInfo360WebService.wsdl",
                  targetNamespace = "http://impl.webservice.service.ecif.infohold.com/") 
public class QueryPerCustInfo360WebServiceImplService extends Service {

    public final static URL WSDL_LOCATION;

    public final static QName SERVICE = new QName("http://impl.webservice.service.ecif.infohold.com/", "QueryPerCustInfo360WebServiceImplService");
    public final static QName QueryPerCustInfo360WebServiceImplPort = new QName("http://impl.webservice.service.ecif.infohold.com/", "QueryPerCustInfo360WebServiceImplPort");
    static {
        URL url = null;
        try {
            url = new URL("file:wsdl/QueryPerCustInfo360WebService.wsdl");
        } catch (MalformedURLException e) {
            java.util.logging.Logger.getLogger(QueryPerCustInfo360WebServiceImplService.class.getName())
                .log(java.util.logging.Level.INFO, 
                     "Can not initialize the default wsdl from {0}", "file:wsdl/QueryPerCustInfo360WebService.wsdl");
        }
        WSDL_LOCATION = url;
    }

    public QueryPerCustInfo360WebServiceImplService(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public QueryPerCustInfo360WebServiceImplService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public QueryPerCustInfo360WebServiceImplService() {
        super(WSDL_LOCATION, SERVICE);
    }
    

    /**
     *
     * @return
     *     returns QueryPerCustInfo360WebService
     */
    @WebEndpoint(name = "QueryPerCustInfo360WebServiceImplPort")
    public QueryPerCustInfo360WebService getQueryPerCustInfo360WebServiceImplPort() {
        return super.getPort(QueryPerCustInfo360WebServiceImplPort, QueryPerCustInfo360WebService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns QueryPerCustInfo360WebService
     */
    @WebEndpoint(name = "QueryPerCustInfo360WebServiceImplPort")
    public QueryPerCustInfo360WebService getQueryPerCustInfo360WebServiceImplPort(WebServiceFeature... features) {
        return super.getPort(QueryPerCustInfo360WebServiceImplPort, QueryPerCustInfo360WebService.class, features);
    }

}
