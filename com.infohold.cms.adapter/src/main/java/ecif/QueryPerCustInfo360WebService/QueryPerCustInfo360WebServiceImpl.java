
/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

package ecif.QueryPerCustInfo360WebService;

import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.7.4
 * 2015-08-19T11:16:37.850+08:00
 * Generated source version: 2.7.4
 * 
 */

@javax.jws.WebService(
                      serviceName = "QueryPerCustInfo360WebServiceImplService",
                      portName = "QueryPerCustInfo360WebServiceImplPort",
                      targetNamespace = "http://impl.webservice.service.ecif.infohold.com/",
                      wsdlLocation = "file:wsdl/QueryPerCustInfo360WebService.wsdl",
                      endpointInterface = "ecif.QueryPerCustInfo360WebService.QueryPerCustInfo360WebService")
                      
public class QueryPerCustInfo360WebServiceImpl implements QueryPerCustInfo360WebService {

    private static final Logger LOG = Logger.getLogger(QueryPerCustInfo360WebServiceImpl.class.getName());

    /* (non-Javadoc)
     * @see ecif.QueryPerCustInfo360WebService.QueryPerCustInfo360WebService#queryPerCustInfo360(ecif.QueryPerCustInfo360WebService.QueryPerCust360RequestDTO  arg0 )*
     */
    public ecif.QueryPerCustInfo360WebService.QueryPerCust360ResponseDTO queryPerCustInfo360(ecif.QueryPerCustInfo360WebService.QueryPerCust360RequestDTO arg0) { 
        LOG.info("Executing operation queryPerCustInfo360");
        System.out.println(arg0);
        try {
            ecif.QueryPerCustInfo360WebService.QueryPerCust360ResponseDTO _return = null;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

}
