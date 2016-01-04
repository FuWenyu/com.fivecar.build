
package ecif.QueryPerCustInfo360WebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for loanInfoItem complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="loanInfoItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="bank_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="gua_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="guarantee_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="loan_amount" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="loan_balance" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="loan_ps" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "loanInfoItem", propOrder = {
    "bankName",
    "guaType",
    "guaranteeId",
    "loanAmount",
    "loanBalance",
    "loanPs"
})
public class LoanInfoItem {

    @XmlElement(name = "bank_name")
    protected String bankName;
    @XmlElement(name = "gua_type")
    protected String guaType;
    @XmlElement(name = "guarantee_id")
    protected String guaranteeId;
    @XmlElement(name = "loan_amount")
    protected String loanAmount;
    @XmlElement(name = "loan_balance")
    protected String loanBalance;
    @XmlElement(name = "loan_ps")
    protected String loanPs;

    /**
     * Gets the value of the bankName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBankName() {
        return bankName;
    }

    /**
     * Sets the value of the bankName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBankName(String value) {
        this.bankName = value;
    }

    /**
     * Gets the value of the guaType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGuaType() {
        return guaType;
    }

    /**
     * Sets the value of the guaType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGuaType(String value) {
        this.guaType = value;
    }

    /**
     * Gets the value of the guaranteeId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGuaranteeId() {
        return guaranteeId;
    }

    /**
     * Sets the value of the guaranteeId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGuaranteeId(String value) {
        this.guaranteeId = value;
    }

    /**
     * Gets the value of the loanAmount property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLoanAmount() {
        return loanAmount;
    }

    /**
     * Sets the value of the loanAmount property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLoanAmount(String value) {
        this.loanAmount = value;
    }

    /**
     * Gets the value of the loanBalance property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLoanBalance() {
        return loanBalance;
    }

    /**
     * Sets the value of the loanBalance property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLoanBalance(String value) {
        this.loanBalance = value;
    }

    /**
     * Gets the value of the loanPs property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLoanPs() {
        return loanPs;
    }

    /**
     * Sets the value of the loanPs property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLoanPs(String value) {
        this.loanPs = value;
    }

}
