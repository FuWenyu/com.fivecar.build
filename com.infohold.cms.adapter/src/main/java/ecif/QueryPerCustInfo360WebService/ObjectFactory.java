
package ecif.QueryPerCustInfo360WebService;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ecif.QueryPerCustInfo360WebService package. 
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

    private final static QName _QueryPerCustInfo360_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "query_perCustInfo360");
    private final static QName _QueryPerCustInfo360Response_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "query_perCustInfo360Response");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ecif.QueryPerCustInfo360WebService
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link BreachInfoItem }
     * 
     */
    public BreachInfoItem createBreachInfoItem() {
        return new BreachInfoItem();
    }

    /**
     * Create an instance of {@link QueryPerCust360ResponseDTO }
     * 
     */
    public QueryPerCust360ResponseDTO createQueryPerCust360ResponseDTO() {
        return new QueryPerCust360ResponseDTO();
    }

    /**
     * Create an instance of {@link QueryPerCustInfo360Response }
     * 
     */
    public QueryPerCustInfo360Response createQueryPerCustInfo360Response() {
        return new QueryPerCustInfo360Response();
    }

    /**
     * Create an instance of {@link SessionContext }
     * 
     */
    public SessionContext createSessionContext() {
        return new SessionContext();
    }

    /**
     * Create an instance of {@link QueryPerCust360RequestDTO }
     * 
     */
    public QueryPerCust360RequestDTO createQueryPerCust360RequestDTO() {
        return new QueryPerCust360RequestDTO();
    }

    /**
     * Create an instance of {@link GuaranteeCustItem }
     * 
     */
    public GuaranteeCustItem createGuaranteeCustItem() {
        return new GuaranteeCustItem();
    }

    /**
     * Create an instance of {@link TransactionStatus }
     * 
     */
    public TransactionStatus createTransactionStatus() {
        return new TransactionStatus();
    }

    /**
     * Create an instance of {@link LoanInfoItem }
     * 
     */
    public LoanInfoItem createLoanInfoItem() {
        return new LoanInfoItem();
    }

    /**
     * Create an instance of {@link CommonRequestDTO }
     * 
     */
    public CommonRequestDTO createCommonRequestDTO() {
        return new CommonRequestDTO();
    }

    /**
     * Create an instance of {@link QueryPerCustInfo360 }
     * 
     */
    public QueryPerCustInfo360 createQueryPerCustInfo360() {
        return new QueryPerCustInfo360();
    }

    /**
     * Create an instance of {@link CommonResponseDTO }
     * 
     */
    public CommonResponseDTO createCommonResponseDTO() {
        return new CommonResponseDTO();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link QueryPerCustInfo360 }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "query_perCustInfo360")
    public JAXBElement<QueryPerCustInfo360> createQueryPerCustInfo360(QueryPerCustInfo360 value) {
        return new JAXBElement<QueryPerCustInfo360>(_QueryPerCustInfo360_QNAME, QueryPerCustInfo360 .class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link QueryPerCustInfo360Response }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "query_perCustInfo360Response")
    public JAXBElement<QueryPerCustInfo360Response> createQueryPerCustInfo360Response(QueryPerCustInfo360Response value) {
        return new JAXBElement<QueryPerCustInfo360Response>(_QueryPerCustInfo360Response_QNAME, QueryPerCustInfo360Response.class, null, value);
    }

}
