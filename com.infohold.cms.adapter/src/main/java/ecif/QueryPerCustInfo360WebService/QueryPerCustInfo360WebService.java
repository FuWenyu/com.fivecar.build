package ecif.QueryPerCustInfo360WebService;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.7.4
 * 2015-08-19T11:16:37.862+08:00
 * Generated source version: 2.7.4
 * 
 */
@WebService(targetNamespace = "http://webservice.service.ecif.infohold.com/", name = "QueryPerCustInfo360WebService")
@XmlSeeAlso({ObjectFactory.class})
public interface QueryPerCustInfo360WebService {

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "query_perCustInfo360", targetNamespace = "http://webservice.service.ecif.infohold.com/", className = "ecif.QueryPerCustInfo360WebService.QueryPerCustInfo360")
    @WebMethod(operationName = "query_perCustInfo360")
    @ResponseWrapper(localName = "query_perCustInfo360Response", targetNamespace = "http://webservice.service.ecif.infohold.com/", className = "ecif.QueryPerCustInfo360WebService.QueryPerCustInfo360Response")
    public ecif.QueryPerCustInfo360WebService.QueryPerCust360ResponseDTO queryPerCustInfo360(
        @WebParam(name = "arg0", targetNamespace = "")
        ecif.QueryPerCustInfo360WebService.QueryPerCust360RequestDTO arg0
    );
}