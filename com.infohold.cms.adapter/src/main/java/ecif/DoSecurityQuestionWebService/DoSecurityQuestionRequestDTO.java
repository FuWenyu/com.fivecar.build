
package ecif.DoSecurityQuestionWebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for doSecurityQuestionRequestDTO complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="doSecurityQuestionRequestDTO">
 *   &lt;complexContent>
 *     &lt;extension base="{http://webservice.service.ecif.infohold.com/}commonRequestDTO">
 *       &lt;sequence>
 *         &lt;element name="answer1" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="answer2" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="answer3" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "doSecurityQuestionRequestDTO", propOrder = {
    "answer1",
    "answer2",
    "answer3",
    "loginId"
})
public class DoSecurityQuestionRequestDTO
    extends CommonRequestDTO
{

    protected String answer1;
    protected String answer2;
    protected String answer3;
    @XmlElement(name = "login_id")
    protected String loginId;

    /**
     * Gets the value of the answer1 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAnswer1() {
        return answer1;
    }

    /**
     * Sets the value of the answer1 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAnswer1(String value) {
        this.answer1 = value;
    }

    /**
     * Gets the value of the answer2 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAnswer2() {
        return answer2;
    }

    /**
     * Sets the value of the answer2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAnswer2(String value) {
        this.answer2 = value;
    }

    /**
     * Gets the value of the answer3 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAnswer3() {
        return answer3;
    }

    /**
     * Sets the value of the answer3 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAnswer3(String value) {
        this.answer3 = value;
    }

    /**
     * Gets the value of the loginId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLoginId() {
        return loginId;
    }

    /**
     * Sets the value of the loginId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLoginId(String value) {
        this.loginId = value;
    }

}
