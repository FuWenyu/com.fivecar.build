
package ecif.QueryPerCustInfoWebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for queryPerCustItem complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="queryPerCustItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cert_duedate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_no" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_place" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_place_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cert_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_duties" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_postcode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_tel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_other1" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_other2" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_other3" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_other4" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_other5" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conn_postcode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_birthdate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_city" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_country" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_education" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_email" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_faxno" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_hobbies" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_home_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_live_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_marstat" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_nation" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_office_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_postcode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_profession" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_province" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_qq" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_register_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_sex" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_taobao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_wechat" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="emer_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="emer_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="family_income" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="graduate_date" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="graduate_school" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="job_startdate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="job_title" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="job_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_email" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="login_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="monthly_income" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_cert_no" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_cert_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_job" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="reterence" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="salary_account" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="salary_bank" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "queryPerCustItem", propOrder = {
    "certDuedate",
    "certNo",
    "certPlace",
    "certPlaceName",
    "certType",
    "companyAddress",
    "companyDuties",
    "companyName",
    "companyPostcode",
    "companyTel",
    "companyType",
    "connAddress",
    "connOther1",
    "connOther2",
    "connOther3",
    "connOther4",
    "connOther5",
    "connPostcode",
    "custBirthdate",
    "custCity",
    "custCountry",
    "custEducation",
    "custEmail",
    "custFaxno",
    "custHobbies",
    "custHomePhone",
    "custId",
    "custLiveAddress",
    "custMarstat",
    "custName",
    "custNation",
    "custOfficePhone",
    "custPhone",
    "custPostcode",
    "custProfession",
    "custProvince",
    "custQq",
    "custRegisterAddress",
    "custSex",
    "custTaobao",
    "custWechat",
    "emerName",
    "emerPhone",
    "familyIncome",
    "graduateDate",
    "graduateSchool",
    "jobStartdate",
    "jobTitle",
    "jobType",
    "loginEmail",
    "loginId",
    "loginPhone",
    "monthlyIncome",
    "partnerCertNo",
    "partnerCertType",
    "partnerJob",
    "partnerName",
    "reterence",
    "salaryAccount",
    "salaryBank"
})
public class QueryPerCustItem {

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
    @XmlElement(name = "company_address")
    protected String companyAddress;
    @XmlElement(name = "company_duties")
    protected String companyDuties;
    @XmlElement(name = "company_name")
    protected String companyName;
    @XmlElement(name = "company_postcode")
    protected String companyPostcode;
    @XmlElement(name = "company_tel")
    protected String companyTel;
    @XmlElement(name = "company_type")
    protected String companyType;
    @XmlElement(name = "conn_address")
    protected String connAddress;
    @XmlElement(name = "conn_other1")
    protected String connOther1;
    @XmlElement(name = "conn_other2")
    protected String connOther2;
    @XmlElement(name = "conn_other3")
    protected String connOther3;
    @XmlElement(name = "conn_other4")
    protected String connOther4;
    @XmlElement(name = "conn_other5")
    protected String connOther5;
    @XmlElement(name = "conn_postcode")
    protected String connPostcode;
    @XmlElement(name = "cust_birthdate")
    protected String custBirthdate;
    @XmlElement(name = "cust_city")
    protected String custCity;
    @XmlElement(name = "cust_country")
    protected String custCountry;
    @XmlElement(name = "cust_education")
    protected String custEducation;
    @XmlElement(name = "cust_email")
    protected String custEmail;
    @XmlElement(name = "cust_faxno")
    protected String custFaxno;
    @XmlElement(name = "cust_hobbies")
    protected String custHobbies;
    @XmlElement(name = "cust_home_phone")
    protected String custHomePhone;
    @XmlElement(name = "cust_id")
    protected String custId;
    @XmlElement(name = "cust_live_address")
    protected String custLiveAddress;
    @XmlElement(name = "cust_marstat")
    protected String custMarstat;
    @XmlElement(name = "cust_name")
    protected String custName;
    @XmlElement(name = "cust_nation")
    protected String custNation;
    @XmlElement(name = "cust_office_phone")
    protected String custOfficePhone;
    @XmlElement(name = "cust_phone")
    protected String custPhone;
    @XmlElement(name = "cust_postcode")
    protected String custPostcode;
    @XmlElement(name = "cust_profession")
    protected String custProfession;
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
    @XmlElement(name = "family_income")
    protected String familyIncome;
    @XmlElement(name = "graduate_date")
    protected String graduateDate;
    @XmlElement(name = "graduate_school")
    protected String graduateSchool;
    @XmlElement(name = "job_startdate")
    protected String jobStartdate;
    @XmlElement(name = "job_title")
    protected String jobTitle;
    @XmlElement(name = "job_type")
    protected String jobType;
    @XmlElement(name = "login_email")
    protected String loginEmail;
    @XmlElement(name = "login_id")
    protected String loginId;
    @XmlElement(name = "login_phone")
    protected String loginPhone;
    @XmlElement(name = "monthly_income")
    protected String monthlyIncome;
    @XmlElement(name = "partner_cert_no")
    protected String partnerCertNo;
    @XmlElement(name = "partner_cert_type")
    protected String partnerCertType;
    @XmlElement(name = "partner_job")
    protected String partnerJob;
    @XmlElement(name = "partner_name")
    protected String partnerName;
    protected String reterence;
    @XmlElement(name = "salary_account")
    protected String salaryAccount;
    @XmlElement(name = "salary_bank")
    protected String salaryBank;

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
     * Gets the value of the companyAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyAddress() {
        return companyAddress;
    }

    /**
     * Sets the value of the companyAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyAddress(String value) {
        this.companyAddress = value;
    }

    /**
     * Gets the value of the companyDuties property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyDuties() {
        return companyDuties;
    }

    /**
     * Sets the value of the companyDuties property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyDuties(String value) {
        this.companyDuties = value;
    }

    /**
     * Gets the value of the companyName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * Sets the value of the companyName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyName(String value) {
        this.companyName = value;
    }

    /**
     * Gets the value of the companyPostcode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyPostcode() {
        return companyPostcode;
    }

    /**
     * Sets the value of the companyPostcode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyPostcode(String value) {
        this.companyPostcode = value;
    }

    /**
     * Gets the value of the companyTel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyTel() {
        return companyTel;
    }

    /**
     * Sets the value of the companyTel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyTel(String value) {
        this.companyTel = value;
    }

    /**
     * Gets the value of the companyType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyType() {
        return companyType;
    }

    /**
     * Sets the value of the companyType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyType(String value) {
        this.companyType = value;
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
     * Gets the value of the connOther1 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConnOther1() {
        return connOther1;
    }

    /**
     * Sets the value of the connOther1 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConnOther1(String value) {
        this.connOther1 = value;
    }

    /**
     * Gets the value of the connOther2 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConnOther2() {
        return connOther2;
    }

    /**
     * Sets the value of the connOther2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConnOther2(String value) {
        this.connOther2 = value;
    }

    /**
     * Gets the value of the connOther3 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConnOther3() {
        return connOther3;
    }

    /**
     * Sets the value of the connOther3 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConnOther3(String value) {
        this.connOther3 = value;
    }

    /**
     * Gets the value of the connOther4 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConnOther4() {
        return connOther4;
    }

    /**
     * Sets the value of the connOther4 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConnOther4(String value) {
        this.connOther4 = value;
    }

    /**
     * Gets the value of the connOther5 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getConnOther5() {
        return connOther5;
    }

    /**
     * Sets the value of the connOther5 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setConnOther5(String value) {
        this.connOther5 = value;
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
     * Gets the value of the custEducation property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustEducation() {
        return custEducation;
    }

    /**
     * Sets the value of the custEducation property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustEducation(String value) {
        this.custEducation = value;
    }

    /**
     * Gets the value of the custEmail property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustEmail() {
        return custEmail;
    }

    /**
     * Sets the value of the custEmail property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustEmail(String value) {
        this.custEmail = value;
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
     * Gets the value of the custHobbies property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustHobbies() {
        return custHobbies;
    }

    /**
     * Sets the value of the custHobbies property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustHobbies(String value) {
        this.custHobbies = value;
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
     * Gets the value of the custMarstat property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustMarstat() {
        return custMarstat;
    }

    /**
     * Sets the value of the custMarstat property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustMarstat(String value) {
        this.custMarstat = value;
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
     * Gets the value of the custPhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustPhone() {
        return custPhone;
    }

    /**
     * Sets the value of the custPhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustPhone(String value) {
        this.custPhone = value;
    }

    /**
     * Gets the value of the custPostcode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustPostcode() {
        return custPostcode;
    }

    /**
     * Sets the value of the custPostcode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustPostcode(String value) {
        this.custPostcode = value;
    }

    /**
     * Gets the value of the custProfession property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustProfession() {
        return custProfession;
    }

    /**
     * Sets the value of the custProfession property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustProfession(String value) {
        this.custProfession = value;
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
     * Gets the value of the familyIncome property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFamilyIncome() {
        return familyIncome;
    }

    /**
     * Sets the value of the familyIncome property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFamilyIncome(String value) {
        this.familyIncome = value;
    }

    /**
     * Gets the value of the graduateDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGraduateDate() {
        return graduateDate;
    }

    /**
     * Sets the value of the graduateDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGraduateDate(String value) {
        this.graduateDate = value;
    }

    /**
     * Gets the value of the graduateSchool property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGraduateSchool() {
        return graduateSchool;
    }

    /**
     * Sets the value of the graduateSchool property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGraduateSchool(String value) {
        this.graduateSchool = value;
    }

    /**
     * Gets the value of the jobStartdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getJobStartdate() {
        return jobStartdate;
    }

    /**
     * Sets the value of the jobStartdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setJobStartdate(String value) {
        this.jobStartdate = value;
    }

    /**
     * Gets the value of the jobTitle property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getJobTitle() {
        return jobTitle;
    }

    /**
     * Sets the value of the jobTitle property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setJobTitle(String value) {
        this.jobTitle = value;
    }

    /**
     * Gets the value of the jobType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getJobType() {
        return jobType;
    }

    /**
     * Sets the value of the jobType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setJobType(String value) {
        this.jobType = value;
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

    /**
     * Gets the value of the monthlyIncome property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMonthlyIncome() {
        return monthlyIncome;
    }

    /**
     * Sets the value of the monthlyIncome property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMonthlyIncome(String value) {
        this.monthlyIncome = value;
    }

    /**
     * Gets the value of the partnerCertNo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerCertNo() {
        return partnerCertNo;
    }

    /**
     * Sets the value of the partnerCertNo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerCertNo(String value) {
        this.partnerCertNo = value;
    }

    /**
     * Gets the value of the partnerCertType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerCertType() {
        return partnerCertType;
    }

    /**
     * Sets the value of the partnerCertType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerCertType(String value) {
        this.partnerCertType = value;
    }

    /**
     * Gets the value of the partnerJob property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerJob() {
        return partnerJob;
    }

    /**
     * Sets the value of the partnerJob property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerJob(String value) {
        this.partnerJob = value;
    }

    /**
     * Gets the value of the partnerName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerName() {
        return partnerName;
    }

    /**
     * Sets the value of the partnerName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerName(String value) {
        this.partnerName = value;
    }

    /**
     * Gets the value of the reterence property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReterence() {
        return reterence;
    }

    /**
     * Sets the value of the reterence property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReterence(String value) {
        this.reterence = value;
    }

    /**
     * Gets the value of the salaryAccount property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSalaryAccount() {
        return salaryAccount;
    }

    /**
     * Sets the value of the salaryAccount property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSalaryAccount(String value) {
        this.salaryAccount = value;
    }

    /**
     * Gets the value of the salaryBank property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSalaryBank() {
        return salaryBank;
    }

    /**
     * Sets the value of the salaryBank property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSalaryBank(String value) {
        this.salaryBank = value;
    }

}
