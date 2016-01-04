
package ecif.QueryPerCustInfo360WebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for transactionStatus complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="transactionStatus">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="replyCode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="replyText" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "transactionStatus", propOrder = {
    "replyCode",
    "replyText"
})
public class TransactionStatus {

    protected String replyCode;
    protected String replyText;

    /**
     * Gets the value of the replyCode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReplyCode() {
        return replyCode;
    }

    /**
     * Sets the value of the replyCode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReplyCode(String value) {
        this.replyCode = value;
    }

    /**
     * Gets the value of the replyText property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReplyText() {
        return replyText;
    }

    /**
     * Sets the value of the replyText property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReplyText(String value) {
        this.replyText = value;
    }

}
