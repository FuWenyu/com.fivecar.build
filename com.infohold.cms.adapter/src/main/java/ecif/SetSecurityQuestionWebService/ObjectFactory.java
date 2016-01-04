
package ecif.SetSecurityQuestionWebService;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ecif.SetSecurityQuestionWebService package. 
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

    private final static QName _SetSecurityQuestionResponse_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "set_securityQuestionResponse");
    private final static QName _SetSecurityQuestion_QNAME = new QName("http://webservice.service.ecif.infohold.com/", "set_securityQuestion");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ecif.SetSecurityQuestionWebService
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
     * Create an instance of {@link SetSecurityQuestion }
     * 
     */
    public SetSecurityQuestion createSetSecurityQuestion() {
        return new SetSecurityQuestion();
    }

    /**
     * Create an instance of {@link CommonRequestDTO }
     * 
     */
    public CommonRequestDTO createCommonRequestDTO() {
        return new CommonRequestDTO();
    }

    /**
     * Create an instance of {@link SetSecurityQuestionRequestDTO }
     * 
     */
    public SetSecurityQuestionRequestDTO createSetSecurityQuestionRequestDTO() {
        return new SetSecurityQuestionRequestDTO();
    }

    /**
     * Create an instance of {@link SetSecurityQuestionResponseDTO }
     * 
     */
    public SetSecurityQuestionResponseDTO createSetSecurityQuestionResponseDTO() {
        return new SetSecurityQuestionResponseDTO();
    }

    /**
     * Create an instance of {@link TransactionStatus }
     * 
     */
    public TransactionStatus createTransactionStatus() {
        return new TransactionStatus();
    }

    /**
     * Create an instance of {@link SetSecurityQuestionResponse }
     * 
     */
    public SetSecurityQuestionResponse createSetSecurityQuestionResponse() {
        return new SetSecurityQuestionResponse();
    }

    /**
     * Create an instance of {@link SessionContext }
     * 
     */
    public SessionContext createSessionContext() {
        return new SessionContext();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SetSecurityQuestionResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "set_securityQuestionResponse")
    public JAXBElement<SetSecurityQuestionResponse> createSetSecurityQuestionResponse(SetSecurityQuestionResponse value) {
        return new JAXBElement<SetSecurityQuestionResponse>(_SetSecurityQuestionResponse_QNAME, SetSecurityQuestionResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SetSecurityQuestion }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.service.ecif.infohold.com/", name = "set_securityQuestion")
    public JAXBElement<SetSecurityQuestion> createSetSecurityQuestion(SetSecurityQuestion value) {
        return new JAXBElement<SetSecurityQuestion>(_SetSecurityQuestion_QNAME, SetSecurityQuestion.class, null, value);
    }

}
