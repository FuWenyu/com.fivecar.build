
package ecif.DoRegisterCustomerWebService;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ecif.DoRegisterCustomerWebService package. 
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

    private final static QName _RegisterCustomer_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "registerCustomer");
    private final static QName _RegisterCustomerResponse_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "registerCustomerResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ecif.DoRegisterCustomerWebService
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link CommonRequestDTO }
     * 
     */
    public CommonRequestDTO createCommonRequestDTO() {
        return new CommonRequestDTO();
    }

    /**
     * Create an instance of {@link SessionContext }
     * 
     */
    public SessionContext createSessionContext() {
        return new SessionContext();
    }

    /**
     * Create an instance of {@link RegisterCustomerResponse }
     * 
     */
    public RegisterCustomerResponse createRegisterCustomerResponse() {
        return new RegisterCustomerResponse();
    }

    /**
     * Create an instance of {@link RegisterCustomer }
     * 
     */
    public RegisterCustomer createRegisterCustomer() {
        return new RegisterCustomer();
    }

    /**
     * Create an instance of {@link RegCustResponseDTO }
     * 
     */
    public RegCustResponseDTO createRegCustResponseDTO() {
        return new RegCustResponseDTO();
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
     * Create an instance of {@link RegCustRequestDTO }
     * 
     */
    public RegCustRequestDTO createRegCustRequestDTO() {
        return new RegCustRequestDTO();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegisterCustomer }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "registerCustomer")
    public JAXBElement<RegisterCustomer> createRegisterCustomer(RegisterCustomer value) {
        return new JAXBElement<RegisterCustomer>(_RegisterCustomer_QNAME, RegisterCustomer.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegisterCustomerResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "registerCustomerResponse")
    public JAXBElement<RegisterCustomerResponse> createRegisterCustomerResponse(RegisterCustomerResponse value) {
        return new JAXBElement<RegisterCustomerResponse>(_RegisterCustomerResponse_QNAME, RegisterCustomerResponse.class, null, value);
    }

}
