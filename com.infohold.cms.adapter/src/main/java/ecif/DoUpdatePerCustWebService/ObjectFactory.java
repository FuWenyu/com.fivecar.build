
package ecif.DoUpdatePerCustWebService;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ecif.DoUpdatePerCustWebService package. 
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

    private final static QName _DoUpdatePerCustInfo_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "do_updatePerCustInfo");
    private final static QName _DoUpdatePerCustInfoResponse_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "do_updatePerCustInfoResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ecif.DoUpdatePerCustWebService
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link CommonResponseDTO }
     * 
     */
    public CommonResponseDTO createCommonResponseDTO() {
        return new CommonResponseDTO();
    }

    /**
     * Create an instance of {@link SessionContext }
     * 
     */
    public SessionContext createSessionContext() {
        return new SessionContext();
    }

    /**
     * Create an instance of {@link DoUpdatePerCustResponseDTO }
     * 
     */
    public DoUpdatePerCustResponseDTO createDoUpdatePerCustResponseDTO() {
        return new DoUpdatePerCustResponseDTO();
    }

    /**
     * Create an instance of {@link DoUpdatePerCustInfoResponse }
     * 
     */
    public DoUpdatePerCustInfoResponse createDoUpdatePerCustInfoResponse() {
        return new DoUpdatePerCustInfoResponse();
    }

    /**
     * Create an instance of {@link DoUpdatePerCustInfo }
     * 
     */
    public DoUpdatePerCustInfo createDoUpdatePerCustInfo() {
        return new DoUpdatePerCustInfo();
    }

    /**
     * Create an instance of {@link CommonRequestDTO }
     * 
     */
    public CommonRequestDTO createCommonRequestDTO() {
        return new CommonRequestDTO();
    }

    /**
     * Create an instance of {@link DoUpdatePerCustRequestDTO }
     * 
     */
    public DoUpdatePerCustRequestDTO createDoUpdatePerCustRequestDTO() {
        return new DoUpdatePerCustRequestDTO();
    }

    /**
     * Create an instance of {@link TransactionStatus }
     * 
     */
    public TransactionStatus createTransactionStatus() {
        return new TransactionStatus();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DoUpdatePerCustInfo }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "do_updatePerCustInfo")
    public JAXBElement<DoUpdatePerCustInfo> createDoUpdatePerCustInfo(DoUpdatePerCustInfo value) {
        return new JAXBElement<DoUpdatePerCustInfo>(_DoUpdatePerCustInfo_QNAME, DoUpdatePerCustInfo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DoUpdatePerCustInfoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "do_updatePerCustInfoResponse")
    public JAXBElement<DoUpdatePerCustInfoResponse> createDoUpdatePerCustInfoResponse(DoUpdatePerCustInfoResponse value) {
        return new JAXBElement<DoUpdatePerCustInfoResponse>(_DoUpdatePerCustInfoResponse_QNAME, DoUpdatePerCustInfoResponse.class, null, value);
    }

}
