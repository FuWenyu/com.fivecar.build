package ecif.DoSecurityQuestionWebService;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * This class was generated by Apache CXF 2.7.4
 * 2015-08-19T11:15:35.160+08:00
 * Generated source version: 2.7.4
 * 
 */
@WebServiceClient(name = "DoSecurityQuestionWebServiceImplService", 
                  wsdlLocation = "file:wsdl/DoSecurityQuestionWebService.wsdl",
                  targetNamespace = "http://impl.webservice.service.ecif.infohold.com/") 
public class DoSecurityQuestionWebServiceImplService extends Service {

    public final static URL WSDL_LOCATION;

    public final static QName SERVICE = new QName("http://impl.webservice.service.ecif.infohold.com/", "DoSecurityQuestionWebServiceImplService");
    public final static QName DoSecurityQuestionWebServiceImplPort = new QName("http://impl.webservice.service.ecif.infohold.com/", "DoSecurityQuestionWebServiceImplPort");
    static {
        URL url = null;
        try {
            url = new URL("file:wsdl/DoSecurityQuestionWebService.wsdl");
        } catch (MalformedURLException e) {
            java.util.logging.Logger.getLogger(DoSecurityQuestionWebServiceImplService.class.getName())
                .log(java.util.logging.Level.INFO, 
                     "Can not initialize the default wsdl from {0}", "file:wsdl/DoSecurityQuestionWebService.wsdl");
        }
        WSDL_LOCATION = url;
    }

    public DoSecurityQuestionWebServiceImplService(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public DoSecurityQuestionWebServiceImplService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public DoSecurityQuestionWebServiceImplService() {
        super(WSDL_LOCATION, SERVICE);
    }
    

    /**
     *
     * @return
     *     returns DoSecurityQuestionWebService
     */
    @WebEndpoint(name = "DoSecurityQuestionWebServiceImplPort")
    public DoSecurityQuestionWebService getDoSecurityQuestionWebServiceImplPort() {
        return super.getPort(DoSecurityQuestionWebServiceImplPort, DoSecurityQuestionWebService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns DoSecurityQuestionWebService
     */
    @WebEndpoint(name = "DoSecurityQuestionWebServiceImplPort")
    public DoSecurityQuestionWebService getDoSecurityQuestionWebServiceImplPort(WebServiceFeature... features) {
        return super.getPort(DoSecurityQuestionWebServiceImplPort, DoSecurityQuestionWebService.class, features);
    }

}