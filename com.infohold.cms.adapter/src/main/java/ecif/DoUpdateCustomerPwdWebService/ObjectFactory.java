
package ecif.DoUpdateCustomerPwdWebService;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ecif.DoUpdateCustomerPwdWebService package. 
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

    private final static QName _DoUpdateCustomerPwdResponse_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "do_updateCustomerPwdResponse");
    private final static QName _DoUpdateCustomerPwd_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "do_updateCustomerPwd");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ecif.DoUpdateCustomerPwdWebService
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DoUpdateCustomerPwd }
     * 
     */
    public DoUpdateCustomerPwd createDoUpdateCustomerPwd() {
        return new DoUpdateCustomerPwd();
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
     * Create an instance of {@link SessionContext }
     * 
     */
    public SessionContext createSessionContext() {
        return new SessionContext();
    }

    /**
     * Create an instance of {@link DoUpdateCustomerPwdResponse }
     * 
     */
    public DoUpdateCustomerPwdResponse createDoUpdateCustomerPwdResponse() {
        return new DoUpdateCustomerPwdResponse();
    }

    /**
     * Create an instance of {@link UpdateCustomerPwdResponseDTO }
     * 
     */
    public UpdateCustomerPwdResponseDTO createUpdateCustomerPwdResponseDTO() {
        return new UpdateCustomerPwdResponseDTO();
    }

    /**
     * Create an instance of {@link UpdateCustomerPwdRequestDTO }
     * 
     */
    public UpdateCustomerPwdRequestDTO createUpdateCustomerPwdRequestDTO() {
        return new UpdateCustomerPwdRequestDTO();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DoUpdateCustomerPwdResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "do_updateCustomerPwdResponse")
    public JAXBElement<DoUpdateCustomerPwdResponse> createDoUpdateCustomerPwdResponse(DoUpdateCustomerPwdResponse value) {
        return new JAXBElement<DoUpdateCustomerPwdResponse>(_DoUpdateCustomerPwdResponse_QNAME, DoUpdateCustomerPwdResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DoUpdateCustomerPwd }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "do_updateCustomerPwd")
    public JAXBElement<DoUpdateCustomerPwd> createDoUpdateCustomerPwd(DoUpdateCustomerPwd value) {
        return new JAXBElement<DoUpdateCustomerPwd>(_DoUpdateCustomerPwd_QNAME, DoUpdateCustomerPwd.class, null, value);
    }

}
