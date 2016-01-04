
package ecif.DoSecurityQuestionWebService;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ecif.DoSecurityQuestionWebService package. 
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

    private final static QName _DoSecurityQuestionResponse_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "do_securityQuestionResponse");
    private final static QName _DoSecurityQuestion_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "do_securityQuestion");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ecif.DoSecurityQuestionWebService
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link TransactionStatus }
     * 
     */
    public TransactionStatus createTransactionStatus() {
        return new TransactionStatus();
    }

    /**
     * Create an instance of {@link SessionContext }
     * 
     */
    public SessionContext createSessionContext() {
        return new SessionContext();
    }

    /**
     * Create an instance of {@link DoSecurityQuestion }
     * 
     */
    public DoSecurityQuestion createDoSecurityQuestion() {
        return new DoSecurityQuestion();
    }

    /**
     * Create an instance of {@link DoSecurityQuestionResponse }
     * 
     */
    public DoSecurityQuestionResponse createDoSecurityQuestionResponse() {
        return new DoSecurityQuestionResponse();
    }

    /**
     * Create an instance of {@link CommonRequestDTO }
     * 
     */
    public CommonRequestDTO createCommonRequestDTO() {
        return new CommonRequestDTO();
    }

    /**
     * Create an instance of {@link CommonResponseDTO }
     * 
     */
    public CommonResponseDTO createCommonResponseDTO() {
        return new CommonResponseDTO();
    }

    /**
     * Create an instance of {@link DoSecurityQuestionResponseDTO }
     * 
     */
    public DoSecurityQuestionResponseDTO createDoSecurityQuestionResponseDTO() {
        return new DoSecurityQuestionResponseDTO();
    }

    /**
     * Create an instance of {@link DoSecurityQuestionRequestDTO }
     * 
     */
    public DoSecurityQuestionRequestDTO createDoSecurityQuestionRequestDTO() {
        return new DoSecurityQuestionRequestDTO();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DoSecurityQuestionResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "do_securityQuestionResponse")
    public JAXBElement<DoSecurityQuestionResponse> createDoSecurityQuestionResponse(DoSecurityQuestionResponse value) {
        return new JAXBElement<DoSecurityQuestionResponse>(_DoSecurityQuestionResponse_QNAME, DoSecurityQuestionResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DoSecurityQuestion }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "do_securityQuestion")
    public JAXBElement<DoSecurityQuestion> createDoSecurityQuestion(DoSecurityQuestion value) {
        return new JAXBElement<DoSecurityQuestion>(_DoSecurityQuestion_QNAME, DoSecurityQuestion.class, null, value);
    }

}
