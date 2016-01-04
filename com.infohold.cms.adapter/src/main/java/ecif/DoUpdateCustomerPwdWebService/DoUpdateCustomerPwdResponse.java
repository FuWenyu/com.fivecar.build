
package ecif.DoUpdateCustomerPwdWebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for do_updateCustomerPwdResponse complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="do_updateCustomerPwdResponse">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="return" type="{http://webservice.service.ecif.infohold.com/}updateCustomerPwdResponseDTO" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "do_updateCustomerPwdResponse", propOrder = {
    "_return"
})
public class DoUpdateCustomerPwdResponse {

    @XmlElement(name = "return")
    protected UpdateCustomerPwdResponseDTO _return;

    /**
     * Gets the value of the return property.
     * 
     * @return
     *     possible object is
     *     {@link UpdateCustomerPwdResponseDTO }
     *     
     */
    public UpdateCustomerPwdResponseDTO getReturn() {
        return _return;
    }

    /**
     * Sets the value of the return property.
     * 
     * @param value
     *     allowed object is
     *     {@link UpdateCustomerPwdResponseDTO }
     *     
     */
    public void setReturn(UpdateCustomerPwdResponseDTO value) {
        this._return = value;
    }

}
