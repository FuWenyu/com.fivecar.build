
package ecif.QueryPerCustInfo360WebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for breachInfoItem complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="breachInfoItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="breach_amount" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="breach_currency" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="breach_date" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="breach_ps" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="breach_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "breachInfoItem", propOrder = {
    "breachAmount",
    "breachCurrency",
    "breachDate",
    "breachPs",
    "breachType"
})
public class BreachInfoItem {

    @XmlElement(name = "breach_amount")
    protected String breachAmount;
    @XmlElement(name = "breach_currency")
    protected String breachCurrency;
    @XmlElement(name = "breach_date")
    protected String breachDate;
    @XmlElement(name = "breach_ps")
    protected String breachPs;
    @XmlElement(name = "breach_type")
    protected String breachType;

    /**
     * Gets the value of the breachAmount property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBreachAmount() {
        return breachAmount;
    }

    /**
     * Sets the value of the breachAmount property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBreachAmount(String value) {
        this.breachAmount = value;
    }

    /**
     * Gets the value of the breachCurrency property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBreachCurrency() {
        return breachCurrency;
    }

    /**
     * Sets the value of the breachCurrency property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBreachCurrency(String value) {
        this.breachCurrency = value;
    }

    /**
     * Gets the value of the breachDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBreachDate() {
        return breachDate;
    }

    /**
     * Sets the value of the breachDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBreachDate(String value) {
        this.breachDate = value;
    }

    /**
     * Gets the value of the breachPs property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBreachPs() {
        return breachPs;
    }

    /**
     * Sets the value of the breachPs property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBreachPs(String value) {
        this.breachPs = value;
    }

    /**
     * Gets the value of the breachType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBreachType() {
        return breachType;
    }

    /**
     * Sets the value of the breachType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBreachType(String value) {
        this.breachType = value;
    }

}
