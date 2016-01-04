
package ecif.DoUpdatePerCustWebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for doUpdatePerCustRequestDTO complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="doUpdatePerCustRequestDTO">
 *   &lt;complexContent>
 *     &lt;extension base="{http://webservice.service.ecif.infohold.com/}commonRequestDTO">
 *       &lt;sequence>
 *         &lt;element name="cert_duedate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_no" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_place" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_place_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_postcode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_birthdate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_city" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_country" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_faxno" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_home_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_live_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_nation" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_office_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_province" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_qq" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_register_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_sex" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_taobao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_wechat" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="emer_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="emer_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_email" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "doUpdatePerCustRequestDTO", propOrder = {
    "certDuedate",
    "certNo",
    "certPlace",
    "certPlaceName",
    "certType",
    "connAddress",
    "connPostcode",
    "custBirthdate",
    "custCity",
    "custCountry",
    "custFaxno",
    "custHomePhone",
    "custId",
    "custLiveAddress",
    "custName",
    "custNation",
    "custOfficePhone",
    "custProvince",
    "custQq",
    "custRegisterAddress",
    "custSex",
    "custTaobao",
    "custWechat",
    "emerName",
    "emerPhone",
    "loginEmail",
    "loginId",
    "loginPhone"
})
public class DoUpdatePerCustRequestDTO
    extends CommonRequestDTO
{

    @XmlElement(name = "cert_duedate")
    protected String certDuedate;
    @XmlElement(name = "cert_no")
    protected String certNo;
    @XmlElement(name = "cert_place")
    protected String certPlace;
    @XmlElement(name = "cert_place_name")
    protected String certPlaceName;
    @XmlElement(name = "cert_type")
    protected String certType;
    @XmlElement(name = "conn_address")
    protected String connAddress;
    @XmlElement(name = "conn_postcode")
    protected String connPostcode;
    @XmlElement(name = "cust_birthdate")
    protected String custBirthdate;
    @XmlElement(name = "cust_city")
    protected String custCity;
    @XmlElement(name = "cust_country")
    protected String custCountry;
    @XmlElement(name = "cust_faxno")
    protected String custFaxno;
    @XmlElement(name = "cust_home_phone")
    protected String custHomePhone;
    @XmlElement(name = "cust_id")
    protected String custId;
    @XmlElement(name = "cust_live_address")
    protected String custLiveAddress;
    @XmlElement(name = "cust_name")
    protected String custName;
    @XmlElement(name = "cust_nation")
    protected String custNation;
    @XmlElement(name = "cust_office_phone")
    protected String custOfficePhone;
    @XmlElement(name = "cust_province")
    protected String custProvince;
    @XmlElement(name = "cust_qq")
    protected String custQq;
    @XmlElement(name = "cust_register_address")
    protected String custRegisterAddress;
    @XmlElement(name = "cust_sex")
    protected String custSex;
    @XmlElement(name = "cust_taobao")
    protected String custTaobao;
    @XmlElement(name = "cust_wechat")
    protected String custWechat;
    @XmlElement(name = "emer_name")
    protected String emerName;
    @XmlElement(name = "emer_phone")
    protected String emerPhone;
    @XmlElement(name = "login_email")
    protected String loginEmail;
    @XmlElement(name = "login_id")
    protected String loginId;
    @XmlElement(name = "login_phone")
    protected String loginPhone;

    /**
     * Gets the value of the certDuedate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCertDuedate() {
        return certDuedate;
    }

    /**
     * Sets the value of the certDuedate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCertDuedate(String value) {
        this.certDuedate = value;
    }

    /**
     * Gets the value of the certNo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCertNo() {
        return certNo;
    }

    /**
     * Sets the value of the certNo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCertNo(String value) {
        this.certNo = value;
    }

    /**
     * Gets the value of the certPlace property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCertPlace() {
        return certPlace;
    }

    /**
     * Sets the value of the certPlace property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCertPlace(String value) {
        this.certPlace = value;
    }

    /**
     * Gets the value of the certPlaceName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCertPlaceName() {
        return certPlaceName;
    }

    /**
     * Sets the value of the certPlaceName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCertPlaceName(String value) {
        this.certPlaceName = value;
    }

    /**
     * Gets the value of the certType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCertType() {
        return certType;
    }

    /**
     * Sets the value of the certType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCertType(String value) {
        this.certType = value;
    }

    /**
     * Gets the value of the connAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConnAddress() {
        return connAddress;
    }

    /**
     * Sets the value of the connAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConnAddress(String value) {
        this.connAddress = value;
    }

    /**
     * Gets the value of the connPostcode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConnPostcode() {
        return connPostcode;
    }

    /**
     * Sets the value of the connPostcode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConnPostcode(String value) {
        this.connPostcode = value;
    }

    /**
     * Gets the value of the custBirthdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustBirthdate() {
        return custBirthdate;
    }

    /**
     * Sets the value of the custBirthdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustBirthdate(String value) {
        this.custBirthdate = value;
    }

    /**
     * Gets the value of the custCity property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustCity() {
        return custCity;
    }

    /**
     * Sets the value of the custCity property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustCity(String value) {
        this.custCity = value;
    }

    /**
     * Gets the value of the custCountry property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustCountry() {
        return custCountry;
    }

    /**
     * Sets the value of the custCountry property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustCountry(String value) {
        this.custCountry = value;
    }

    /**
     * Gets the value of the custFaxno property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustFaxno() {
        return custFaxno;
    }

    /**
     * Sets the value of the custFaxno property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustFaxno(String value) {
        this.custFaxno = value;
    }

    /**
     * Gets the value of the custHomePhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustHomePhone() {
        return custHomePhone;
    }

    /**
     * Sets the value of the custHomePhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustHomePhone(String value) {
        this.custHomePhone = value;
    }

    /**
     * Gets the value of the custId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustId() {
        return custId;
    }

    /**
     * Sets the value of the custId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustId(String value) {
        this.custId = value;
    }

    /**
     * Gets the value of the custLiveAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustLiveAddress() {
        return custLiveAddress;
    }

    /**
     * Sets the value of the custLiveAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustLiveAddress(String value) {
        this.custLiveAddress = value;
    }

    /**
     * Gets the value of the custName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustName() {
        return custName;
    }

    /**
     * Sets the value of the custName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustName(String value) {
        this.custName = value;
    }

    /**
     * Gets the value of the custNation property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustNation() {
        return custNation;
    }

    /**
     * Sets the value of the custNation property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustNation(String value) {
        this.custNation = value;
    }

    /**
     * Gets the value of the custOfficePhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustOfficePhone() {
        return custOfficePhone;
    }

    /**
     * Sets the value of the custOfficePhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustOfficePhone(String value) {
        this.custOfficePhone = value;
    }

    /**
     * Gets the value of the custProvince property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustProvince() {
        return custProvince;
    }

    /**
     * Sets the value of the custProvince property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustProvince(String value) {
        this.custProvince = value;
    }

    /**
     * Gets the value of the custQq property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustQq() {
        return custQq;
    }

    /**
     * Sets the value of the custQq property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustQq(String value) {
        this.custQq = value;
    }

    /**
     * Gets the value of the custRegisterAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustRegisterAddress() {
        return custRegisterAddress;
    }

    /**
     * Sets the value of the custRegisterAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustRegisterAddress(String value) {
        this.custRegisterAddress = value;
    }

    /**
     * Gets the value of the custSex property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustSex() {
        return custSex;
    }

    /**
     * Sets the value of the custSex property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustSex(String value) {
        this.custSex = value;
    }

    /**
     * Gets the value of the custTaobao property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustTaobao() {
        return custTaobao;
    }

    /**
     * Sets the value of the custTaobao property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustTaobao(String value) {
        this.custTaobao = value;
    }

    /**
     * Gets the value of the custWechat property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustWechat() {
        return custWechat;
    }

    /**
     * Sets the value of the custWechat property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustWechat(String value) {
        this.custWechat = value;
    }

    /**
     * Gets the value of the emerName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEmerName() {
        return emerName;
    }

    /**
     * Sets the value of the emerName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEmerName(String value) {
        this.emerName = value;
    }

    /**
     * Gets the value of the emerPhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEmerPhone() {
        return emerPhone;
    }

    /**
     * Sets the value of the emerPhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEmerPhone(String value) {
        this.emerPhone = value;
    }

    /**
     * Gets the value of the loginEmail property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLoginEmail() {
        return loginEmail;
    }

    /**
     * Sets the value of the loginEmail property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLoginEmail(String value) {
        this.loginEmail = value;
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

}
