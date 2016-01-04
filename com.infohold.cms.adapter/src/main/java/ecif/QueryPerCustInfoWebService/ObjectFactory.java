
package ecif.QueryPerCustInfoWebService;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ecif.QueryPerCustInfoWebService package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _QueryPerCustInfoResponse_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "query_perCustInfoResponse");
    private final static QName _QueryPerCustInfo_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "query_perCustInfo");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ecif.QueryPerCustInfoWebService
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link SessionContext }
     * 
     */
    public SessionContext createSessionContext() {
        return new SessionContext();
    }

    /**
     * Create an instance of {@link QueryPerCustInfo }
     * 
     */
    public QueryPerCustInfo createQueryPerCustInfo() {
        return new QueryPerCustInfo();
    }

    /**
     * Create an instance of {@link QueryPerCustResponseDTO }
     * 
     */
    public QueryPerCustResponseDTO createQueryPerCustResponseDTO() {
        return new QueryPerCustResponseDTO();
    }

    /**
     * Create an instance of {@link QueryPerCustItem }
     * 
     */
    public QueryPerCustItem createQueryPerCustItem() {
        return new QueryPerCustItem();
    }

    /**
     * Create an instance of {@link CommonResponseDTO }
     * 
     */
    public CommonResponseDTO createCommonResponseDTO() {
        return new CommonResponseDTO();
    }

    /**
     * Create an instance of {@link TransactionStatus }
     * 
     */
    public TransactionStatus createTransactionStatus() {
        return new TransactionStatus();
    }

    /**
     * Create an instance of {@link CommonRequestDTO }
     * 
     */
    public CommonRequestDTO createCommonRequestDTO() {
        return new CommonRequestDTO();
    }

    /**
     * Create an instance of {@link QueryPerCustRequestDTO }
     * 
     */
    public QueryPerCustRequestDTO createQueryPerCustRequestDTO() {
        return new QueryPerCustRequestDTO();
    }

    /**
     * Create an instance of {@link QueryPerCustInfoResponse }
     * 
     */
    public QueryPerCustInfoResponse createQueryPerCustInfoResponse() {
        return new QueryPerCustInfoResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link QueryPerCustInfoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "query_perCustInfoResponse")
    public JAXBElement<QueryPerCustInfoResponse> createQueryPerCustInfoResponse(QueryPerCustInfoResponse value) {
        return new JAXBElement<QueryPerCustInfoResponse>(_QueryPerCustInfoResponse_QNAME, QueryPerCustInfoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link QueryPerCustInfo }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "query_perCustInfo")
    public JAXBElement<QueryPerCustInfo> createQueryPerCustInfo(QueryPerCustInfo value) {
        return new JAXBElement<QueryPerCustInfo>(_QueryPerCustInfo_QNAME, QueryPerCustInfo.class, null, value);
    }

}
