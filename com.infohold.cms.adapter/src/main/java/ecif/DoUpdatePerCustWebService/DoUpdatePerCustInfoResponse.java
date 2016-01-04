
package ecif.DoUpdatePerCustWebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for do_updatePerCustInfoResponse complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="do_updatePerCustInfoResponse">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="return" type="{http://webservice.service.ecif.infohold.com/}doUpdatePerCustResponseDTO" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "do_updatePerCustInfoResponse", propOrder = {
    "_return"
})
public class DoUpdatePerCustInfoResponse {

    @XmlElement(name = "return")
    protected DoUpdatePerCustResponseDTO _return;

    /**
     * Gets the value of the return property.
     * 
     * @return
     *     possible object is
     *     {@link DoUpdatePerCustResponseDTO }
     *     
     */
    public DoUpdatePerCustResponseDTO getReturn() {
        return _return;
    }

    /**
     * Sets the value of the return property.
     * 
     * @param value
     *     allowed object is
     *     {@link DoUpdatePerCustResponseDTO }
     *     
     */
    public void setReturn(DoUpdatePerCustResponseDTO value) {
        this._return = value;
    }

}
