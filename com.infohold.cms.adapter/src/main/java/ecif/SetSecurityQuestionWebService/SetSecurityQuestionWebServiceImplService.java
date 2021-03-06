package ecif.SetSecurityQuestionWebService;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * This class was generated by Apache CXF 2.7.4
 * 2015-08-19T11:16:59.756+08:00
 * Generated source version: 2.7.4
 * 
 */
@WebServiceClient(name = "SetSecurityQuestionWebServiceImplService", 
                  wsdlLocation = "file:wsdl/SetSecurityQuestionWebService.wsdl",
                  targetNamespace = "http://impl.webservice.service.ecif.infohold.com/") 
public class SetSecurityQuestionWebServiceImplService extends Service {

    public final static URL WSDL_LOCATION;

    public final static QName SERVICE = new QName("http://impl.webservice.service.ecif.infohold.com/", "SetSecurityQuestionWebServiceImplService");
    public final static QName SetSecurityQuestionWebServiceImplPort = new QName("http://impl.webservice.service.ecif.infohold.com/", "SetSecurityQuestionWebServiceImplPort");
    static {
        URL url = null;
        try {
            url = new URL("file:wsdl/SetSecurityQuestionWebService.wsdl");
        } catch (MalformedURLException e) {
            java.util.logging.Logger.getLogger(SetSecurityQuestionWebServiceImplService.class.getName())
                .log(java.util.logging.Level.INFO, 
                     "Can not initialize the default wsdl from {0}", "file:wsdl/SetSecurityQuestionWebService.wsdl");
        }
        WSDL_LOCATION = url;
    }

    public SetSecurityQuestionWebServiceImplService(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public SetSecurityQuestionWebServiceImplService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public SetSecurityQuestionWebServiceImplService() {
        super(WSDL_LOCATION, SERVICE);
    }
    

    /**
     *
     * @return
     *     returns SetSecurityQuestionWebService
     */
    @WebEndpoint(name = "SetSecurityQuestionWebServiceImplPort")
    public SetSecurityQuestionWebService getSetSecurityQuestionWebServiceImplPort() {
        return super.getPort(SetSecurityQuestionWebServiceImplPort, SetSecurityQuestionWebService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns SetSecurityQuestionWebService
     */
    @WebEndpoint(name = "SetSecurityQuestionWebServiceImplPort")
    public SetSecurityQuestionWebService getSetSecurityQuestionWebServiceImplPort(WebServiceFeature... features) {
        return super.getPort(SetSecurityQuestionWebServiceImplPort, SetSecurityQuestionWebService.class, features);
    }

}
