
package ecif.DoRegisterCustomerWebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for regCustRequestDTO complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="regCustRequestDTO">
 *   &lt;complexContent>
 *     &lt;extension base="{http://webservice.service.ecif.infohold.com/}commonRequestDTO">
 *       &lt;sequence>
 *         &lt;element name="cust_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_pwd" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "regCustRequestDTO", propOrder = {
    "custType",
    "loginPhone",
    "loginPwd"
})
public class RegCustRequestDTO
    extends CommonRequestDTO
{

    @XmlElement(name = "cust_type")
    protected String custType;
    @XmlElement(name = "login_phone")
    protected String loginPhone;
    @XmlElement(name = "login_pwd")
    protected String loginPwd;

    /**
     * Gets the value of the custType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustType() {
        return custType;
    }

    /**
     * Sets the value of the custType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustType(String value) {
        this.custType = value;
    }

    /**
     * Gets the value of the loginPhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLoginPhone() {
        return loginPhone;
    }

    /**
     * Sets the value of the loginPhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLoginPhone(String value) {
        this.loginPhone = value;
    }

    /**
     * Gets the value of the loginPwd property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLoginPwd() {
        return loginPwd;
    }

    /**
     * Sets the value of the loginPwd property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLoginPwd(String value) {
        this.loginPwd = value;
    }

}
