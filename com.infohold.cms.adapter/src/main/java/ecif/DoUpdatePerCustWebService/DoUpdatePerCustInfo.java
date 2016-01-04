
package ecif.DoUpdatePerCustWebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for do_updatePerCustInfo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="do_updatePerCustInfo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="arg0" type="{http://webservice.service.ecif.infohold.com/}doUpdatePerCustRequestDTO" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "do_updatePerCustInfo", propOrder = {
    "arg0"
})
public class DoUpdatePerCustInfo {

    protected DoUpdatePerCustRequestDTO arg0;

    /**
     * Gets the value of the arg0 property.
     * 
     * @return
     *     possible object is
     *     {@link DoUpdatePerCustRequestDTO }
     *     
     */
    public DoUpdatePerCustRequestDTO getArg0() {
        return arg0;
    }

    /**
     * Sets the value of the arg0 property.
     * 
     * @param value
     *     allowed object is
     *     {@link DoUpdatePerCustRequestDTO }
     *     
     */
    public void setArg0(DoUpdatePerCustRequestDTO value) {
        this.arg0 = value;
    }

}
